package com.hh.ssm.util;

import com.hh.ssm.domain.customize.CustomResult;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/18  11:03 AM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/18    create
 */
public class ResultUtil {

    public static CustomResult dealResult(int res,int status, String msg) {
        if (res > 0) {
            return CustomResult.ok();
        } else {
            return CustomResult.build(status, msg);
        }
    }
}