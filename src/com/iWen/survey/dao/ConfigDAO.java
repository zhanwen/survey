package com.iWen.survey.dao;

import com.iWen.survey.dto.Config;

public interface ConfigDAO {

	boolean updateConfig(Config config);
	Config findConfig();
}
