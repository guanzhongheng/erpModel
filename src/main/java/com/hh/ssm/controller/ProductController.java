package com.hh.ssm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.hh.ssm.domain.customize.CustomResult;
import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.param.ProductForm;
import com.hh.ssm.domain.vo.ProductVO;
import com.hh.ssm.domain.vo.SemiProductVO;
import com.hh.ssm.entity.Product;
import com.hh.ssm.entity.SemiProduct;
import com.hh.ssm.service.IProductService;
import com.hh.ssm.service.ISemiProductService;
import com.hh.ssm.util.Const;
import com.hh.ssm.util.ResultUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.net.SocketImpl;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Author ljk
 * Date  2019-05-17
 */
@Controller
@RequestMapping(value = "/product")
public class ProductController {
    @Autowired
    private IProductService productService;
    @Autowired
    private ISemiProductService semiProductService;

    @RequestMapping("/get/{code}")
    @ResponseBody
    public ProductVO getItemById(@PathVariable String id) throws Exception {
        Product product = productService.get(id);
        ProductVO productVO = new ProductVO();
        //转换vo
        return productVO;
    }

    @RequestMapping("/find")
    public String find() throws Exception {
        return "dictionary/product_list";
    }

    @RequestMapping("/get_data")
    @ResponseBody
    public List<Product> getData() throws Exception {
        return productService.findAllList();
    }

    @RequestMapping("/add")
    public String add() throws Exception {
        return "dictionary/product_add";
    }

    @RequestMapping("/edit")
    public String edit() throws Exception {
        return "dictionary/product_edit";
    }

    @RequestMapping("/search")
    public String search() throws Exception {
        return "dictionary/product_search";
    }

    @RequestMapping("/list")
    @ResponseBody
    public EUDataGridResult getList(ProductVO vo) throws Exception {
        Product product = new Product();
        BeanUtils.copyProperties(vo, product);
        product.setCategory('0');
        EUDataGridResult result = productService.getList(vo.getPage(), vo.getRows(), product);
        return result;
    }

    @RequestMapping("/semiprod")
    @ResponseBody
    public List<SemiProductVO> getSemiProdList() {
        List<SemiProductVO> vos = new ArrayList<>();
        List<SemiProduct> list = semiProductService.findAllList();
        if(list != null && !list.isEmpty()) {
            SemiProduct sprod;
            for(int i = 0, length = list.size(); i < length; i ++) {
                SemiProductVO vo = new SemiProductVO();
                sprod = list.get(i);
                vo.setCode(sprod.getCode());
                vo.setSpecification(sprod.getSpecification());
                vo.setName(sprod.getName());
                vo.setId(sprod.getId());
                vos.add(vo);
            }
        }
        return vos;
    }

    @RequestMapping("/{id}/semiprod")
    @ResponseBody
    public EUDataGridResult getSemiProdByProdId(@PathVariable String id) throws Exception {
        List<SemiProductVO> list = productService.getSemiProdByProdId(id);
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<SemiProductVO> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ResponseBody
    private CustomResult insert(@RequestBody  ProductVO vo, BindingResult bindingResult) throws Exception {
        Product product = new Product();
        BeanUtils.copyProperties(vo, product);
        product.setCreateTime(new Date(System.currentTimeMillis()));
        product.setCategory('0');
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        product.setCode(Const.PROD_PREFIX + sdf.format(new Date()));
        List<SemiProductVO> semiProdList = vo.getSemiProdList();
        if(semiProdList != null &&!semiProdList.isEmpty()) {
            List<ProductForm> pfList = new ArrayList<>(semiProdList.size());
            ProductForm form;
            for(SemiProductVO semiProduct : semiProdList) {
                form = new ProductForm();
                form.setId(semiProduct.getId());
                form.setQuantity(semiProduct.getQuantity());
                form.setUnit(semiProduct.getUnit());
                pfList.add(form);
            }
            product.setSemiProdCons(JSONArray.parseArray(JSON.toJSONString(pfList)).toJSONString());
        }
        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
            return CustomResult.build(100, fieldError.getDefaultMessage());
        }
        int res = productService.insert(product);
        return ResultUtil.dealResult(res, 101, "新增产品信息失败");
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    private CustomResult update(@RequestBody ProductVO vo, BindingResult bindingResult) throws Exception {
        Product product = new Product();
        BeanUtils.copyProperties(vo, product);
        product.setCategory('0');
        List<SemiProductVO> semiProdList = vo.getSemiProdList();
        if(semiProdList != null &&!semiProdList.isEmpty()) {
            JSONArray array = new JSONArray();
            for(SemiProductVO semiProduct : semiProdList) {
                JSONObject object = new JSONObject();
                object.put("id", semiProduct.getId());
                object.put("quantity", semiProduct.getQuantity());
                object.put("unit", semiProduct.getUnit());
                array.add(object);
            }
            product.setSemiProdCons(array.toString());
        }
        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
            return CustomResult.build(100, fieldError.getDefaultMessage());
        }
        Product prod = productService.get(product.getId()+"");
        int rs;
        if(!prod.getName().equals(product.getName()) || !prod.getSpecification().equals(product.getSpecification()) || !prod.getType().equals(product.getType())) {
            product.setCreateTime(new Date(System.currentTimeMillis()));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
            product.setCode(Const.PROD_PREFIX + sdf.format(new Date()));
            rs = productService.insert(product);
            return ResultUtil.dealResult(rs, 101, "新增产品信息失败");
        }else{
            product.setUpdateTime(new Date(System.currentTimeMillis()));
            rs = productService.update(product);
            return ResultUtil.dealResult(rs, 101, "更新产品信息失败");
        }
    }

    @RequestMapping(value = "/update_all")
    @ResponseBody
    private CustomResult updateAll(@Valid Product product, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
            return CustomResult.build(100, fieldError.getDefaultMessage());
        }
        int rs = productService.updateAll(product);

        return ResultUtil.dealResult(rs, 101, "批量更新产品信息失败");
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    private CustomResult delete(String id) throws Exception {
        int rs = productService.delete(id);

        return ResultUtil.dealResult(rs, 101, "删除产品信息失败");
    }

    @RequestMapping(value = "/delete_batch")
    @ResponseBody
    private CustomResult deleteBatch(String[] ids) throws Exception {
        int rs = productService.deleteBatch(Arrays.asList(ids));
        return ResultUtil.dealResult(rs, 101, "批量删除产品信息失败");
    }
}
