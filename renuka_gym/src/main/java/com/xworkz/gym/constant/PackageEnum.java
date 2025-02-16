package com.xworkz.gym.constant;

public enum PackageEnum {
    ELITE(25000),
    PRO(10000),
    TRANSFORM(5000),
    PLATINUM(15000);

    private final int price;

    PackageEnum(int price) {
        this.price = price;
    }

    public int getPrice() {
        return price;
    }
}

