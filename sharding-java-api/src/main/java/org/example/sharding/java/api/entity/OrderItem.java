package org.example.sharding.java.api.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderItem {

    private Integer id;

    private Integer orderId;

    private String productName;

    private String remark;

}
