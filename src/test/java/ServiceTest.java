import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hh.ssm.domain.param.ProductForm;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/28  3:47 PM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/28    create
 */
public class ServiceTest {
    public static void main(String[] args) {
        ProductForm form = new ProductForm();
        form.setId(1L);
        form.setUnit("kg");
        form.setQuantity(20);
        List<ProductForm> pf = new ArrayList<>();
        pf.add(form);
        form = new ProductForm();
        form.setId(2L);
        form.setUnit("kg");
        form.setQuantity(25);
        pf.add(form);
        String str = JSONArray.parseArray(JSON.toJSONString(pf)).toJSONString();
        System.out.println(str);
        List<ProductForm> productForms = JSONObject.parseArray(str, ProductForm.class);
        System.out.println(productForms);


    }

    class Product{
        private Long id;

        public Long getId() {
            return id;
        }

        public void setId(Long id) {
            this.id = id;
        }
    }
}