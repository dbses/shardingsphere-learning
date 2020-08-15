package org.example.sharding.java.api.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Order {

    private Integer id;

    private String name;

    private String remark;
}
