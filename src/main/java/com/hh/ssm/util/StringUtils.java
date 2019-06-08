package com.hh.ssm.util;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/31  11:27 PM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/31    create
 */
public class StringUtils {

    public static String genString(String prefix) {
        return prefix + DateUtil.getSdfTimes();
    }
}