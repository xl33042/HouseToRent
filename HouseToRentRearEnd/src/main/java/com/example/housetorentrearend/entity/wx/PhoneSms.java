package com.example.housetorentrearend.entity.wx;


import lombok.Data;

@Data
public class PhoneSms {
    private String phoneNumber;
    private String code;
    private int min;
}
