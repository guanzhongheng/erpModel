package com.hh.ssm.component;

import com.hh.ssm.common.DictUtils;
import com.hh.ssm.dao.ProductMapper;
import com.hh.ssm.dao.RawMaterialMapper;
import com.hh.ssm.dao.SemiProductMapper;
import com.hh.ssm.entity.Product;
import com.hh.ssm.entity.RawMaterial;
import com.hh.ssm.entity.SemiProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/29  11:13 AM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/29    create
 */
@Component
public class PreLoadComponent {
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private SemiProductMapper semiProductMapper;
    @Autowired
    private RawMaterialMapper rawMaterialMapper;

    private volatile boolean flg = false;

    @PostConstruct
    public void init() {
        if (!flg) {
            Product product = new Product();
            product.setCategory('0');
            List<Product> prodList = productMapper.findList(product);
            if (prodList != null && !prodList.isEmpty()) {
                Map<Long, Product> prodMaps = new HashMap<>(prodList.size());
                for (Product pd :
                        prodList) {
                    prodMaps.put(pd.getId(), pd);
                }
                DictUtils.setStandProdMaps(prodMaps);
            }

            List<SemiProduct> semiProds = semiProductMapper.findAllList();
            if (semiProds != null && !semiProds.isEmpty()) {
                Map<Long, SemiProduct> semiProdMap = new HashMap<>(semiProds.size());
                for (SemiProduct semiProd :
                        semiProds) {
                    semiProdMap.put(semiProd.getId(), semiProd);
                }

                DictUtils.setSemiProdMaps(semiProdMap);
            }

            List<RawMaterial> rawMaterials = rawMaterialMapper.findAllList();
            if (rawMaterials != null && !rawMaterials.isEmpty()) {
                Map<Long, RawMaterial> rawMaterialMap = new HashMap<>(rawMaterials.size());
                for (RawMaterial rawMa :
                        rawMaterials) {
                    rawMaterialMap.put(rawMa.getId(), rawMa);

                }
                DictUtils.setRawMaterialMaps(rawMaterialMap);
            }

            flg = true;
        }

    }
}