package com.lin.dao.product;

import com.lin.dao.BaseDao;
import com.lin.entity.product.Uploadfile;
import com.lin.model.PageModel;

public interface UploadFileDao extends BaseDao<Uploadfile> {

	@Override
	public PageModel<Uploadfile> find(int pageNo, int maxResult, String where,
			Object[] queryParams);
}
