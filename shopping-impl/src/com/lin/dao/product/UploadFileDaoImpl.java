package com.lin.dao.product;

import java.util.Map;

import com.lin.dao.DaoSupport;
import com.lin.entity.product.Uploadfile;
import com.lin.model.PageModel;

public class UploadFileDaoImpl extends DaoSupport<Uploadfile> implements UploadFileDao {

	@Override
	public PageModel<Uploadfile> find(String where, Object[] queryParams,
			Map<String, String> orderby, int pageNo, int maxResult) {
		orderby.put("iscover", "desc");
		return super.find(where, queryParams, orderby, pageNo, maxResult);
	}
}
