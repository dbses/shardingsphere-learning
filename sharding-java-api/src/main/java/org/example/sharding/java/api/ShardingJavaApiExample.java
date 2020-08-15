package org.example.sharding.java.api;

import org.apache.shardingsphere.api.config.sharding.KeyGeneratorConfiguration;
import org.apache.shardingsphere.api.config.sharding.ShardingRuleConfiguration;
import org.apache.shardingsphere.api.config.sharding.TableRuleConfiguration;
import org.apache.shardingsphere.api.config.sharding.strategy.InlineShardingStrategyConfiguration;
import org.apache.shardingsphere.shardingjdbc.api.ShardingDataSourceFactory;
import org.example.sharding.java.api.entity.OrderItem;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class ShardingJavaApiExample {

    public static void main(String[] args) throws SQLException {
        ShardingJavaApiExample example = new ShardingJavaApiExample();
        DataSource dataSource = example.getShardingDataSource();
        String sql = "SELECT " +
                "i.id as item_id, " +
                "o.id as order_id, " +
                "i.product_name, " +
                "i.remark, " +
                "o.remark " +
                "FROM " +
                "t_order o " +
                "INNER JOIN t_order_item i ON i.order_id = o.id;";
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(resultSet.getInt(1));
            orderItem.setId(resultSet.getInt(2));
            orderItem.setProductName(resultSet.getString(3));
            orderItem.setRemark(resultSet.getString(4) + "<->" + resultSet.getString(5));
            System.out.println(orderItem);
        }
    }

    DataSource getShardingDataSource() throws SQLException {
        ShardingRuleConfiguration shardingRuleConfig = new ShardingRuleConfiguration();
        shardingRuleConfig.getTableRuleConfigs().add(getOrderTableRuleConfiguration());
        shardingRuleConfig.getTableRuleConfigs().add(getOrderItemTableRuleConfiguration());
//        shardingRuleConfig.getBindingTableGroups().add("t_order");
//        shardingRuleConfig.getBindingTableGroups().add("t_order, t_order_item");
//        shardingRuleConfig.getBroadcastTables().add("t_config");
        shardingRuleConfig.setDefaultDatabaseShardingStrategyConfig(new InlineShardingStrategyConfiguration("order_id", "ds${order_id % 2}"));
//        shardingRuleConfig.setDefaultTableShardingStrategyConfig(new StandardShardingStrategyConfiguration("order_id", new PreciseModuloShardingTableAlgorithm()));
        return ShardingDataSourceFactory.createDataSource(createDataSourceMap(), shardingRuleConfig, new Properties());
    }

    private static KeyGeneratorConfiguration getKeyGeneratorConfiguration() {
        return new KeyGeneratorConfiguration("SNOWFLAKE", "order_id");
    }

    TableRuleConfiguration getOrderTableRuleConfiguration() {
        TableRuleConfiguration result = new TableRuleConfiguration("t_order", "ds0.t_order${0..1}");
        result.setKeyGeneratorConfig(getKeyGeneratorConfiguration());
        return result;
    }

    TableRuleConfiguration getOrderItemTableRuleConfiguration() {
        return new TableRuleConfiguration("t_order_item", "ds0.t_order_item${0..1}");
    }

    Map<String, DataSource> createDataSourceMap() {
        Map<String, DataSource> result = new HashMap<>();
        result.put("ds0", DataSourceUtil.createDataSource("demo_ds_0"));
//        result.put("ds1", DataSourceUtil.createDataSource("demo_ds_1"));
        return result;
    }

}
