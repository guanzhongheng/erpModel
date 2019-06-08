package com.hh.ssm.common;

import com.hh.ssm.entity.Product;
import com.hh.ssm.entity.RawMaterial;
import com.hh.ssm.entity.SemiProduct;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/29  11:09 AM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/29    create
 */
public class DictUtils {
    //半产品
    private static Map<Long, SemiProduct> semiProdMaps = new HashMap<>(100);
    //产品
    private static Map<Long, Product> standProdMaps = new HashMap<>(100);
    //原材料
    private static Map<Long, RawMaterial> rawMaterialMaps = new HashMap<>(100);

    public static void setSemiProdMaps(Map<Long, SemiProduct> semiProdMaps) {
        DictUtils.semiProdMaps = semiProdMaps;
    }

    public static void setStandProdMaps(Map<Long, Product> standProdMaps) {
        DictUtils.standProdMaps = standProdMaps;
    }

    public static void setRawMaterialMaps(Map<Long, RawMaterial> rawMaterialMaps) {
        DictUtils.rawMaterialMaps = rawMaterialMaps;
    }


    public static List<Product> getProductsByIds(List<Long> idList) {
        List<Product> prods = new ArrayList<>(idList.size());
        for (Long dictKey :
                idList) {
            prods.add(standProdMaps.get(dictKey));
        }
        return prods;
    }


    public static List<SemiProduct> getSemiProdsByIds(List<Long> idList) {
        List<SemiProduct> prods = new ArrayList<>(idList.size());
        for (Long dictKey :
                idList) {
            prods.add(semiProdMaps.get(dictKey));
        }
        return prods;
    }

    public static List<RawMaterial> getRawMaterialsByIds(List<Long> idList) {
        List<RawMaterial> prods = new ArrayList<>(idList.size());
        for (Long dictKey :
                idList) {
            prods.add(rawMaterialMaps.get(dictKey));
        }
        return prods;
    }


    public static boolean containKey(Character dictType, Long dictKey) {
        if (dictType.equals(Constants.DICT_TYPE_PROD)) {
            return standProdMaps.containsKey(dictKey);
        } else if (dictType.equals(Constants.DICT_TYPE_SEMI_PROD)) {
            return semiProdMaps.containsKey(dictKey);
        } else if (dictType.equals(Constants.DICT_TYPE_RAWMAT)) {
            return rawMaterialMaps.containsKey(dictKey);
        }
        return false;
    }

    public static Product getProductById(Long dictKey) {
        return standProdMaps.get(dictKey);
    }

    public static SemiProduct getSemiProductById(Long dictKey) {
        return semiProdMaps.get(dictKey);
    }

    public static RawMaterial getRawMaterById(Long dictKey) {
        return rawMaterialMaps.get(dictKey);
    }

    public static void putProduct(Product product) {
        standProdMaps.put(product.getId(), product);
    }

    public static void putSemiProduct(SemiProduct semiProduct) {
        semiProdMaps.put(semiProduct.getId(), semiProduct);
    }

    public static void putRawMaterial(RawMaterial rawMaterial) {
        rawMaterialMaps.put(rawMaterial.getId(), rawMaterial);
    }

}