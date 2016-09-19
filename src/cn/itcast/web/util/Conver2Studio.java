package cn.itcast.web.util;

import java.util.Map;

import javax.annotation.Resource;

import cn.itcast.domain.Studio;
import cn.itcast.service.StudioService;

import com.opensymphony.xwork2.conversion.impl.DefaultTypeConverter;

public class Conver2Studio extends DefaultTypeConverter {
	@Resource private StudioService ss;

	@Override
	public Object convertValue(Map<String, Object> context, Object value,
			Class toType) {
		
		if(toType==Studio.class){ //当字符串向Gender类型转换时
			Integer[] params=(Integer[])value;
			if(params[0]==null)
			{return null;}
			return ss.find(params[0]);}
		return null;
	}
	
}

