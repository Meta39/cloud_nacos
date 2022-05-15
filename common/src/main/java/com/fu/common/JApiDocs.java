package com.fu.common;

import io.github.yedaxia.apidocs.Docs;
import io.github.yedaxia.apidocs.DocsConfig;
import io.github.yedaxia.apidocs.plugin.markdown.MarkdownDocPlugin;

public class JApiDocs {
    /**
     * 生成离线接口文档
     */
    public static void main(String[] args) {
        DocsConfig config = new DocsConfig();
        String projectName = "基础系统base";
        config.setProjectPath("D:/workspace/cloud_nacos/base/src/main/java/com/fu/base"); // 项目根目录
        config.setProjectName(projectName); // 项目名称
        config.setApiVersion(projectName);       // 声明该API的版本
        config.setDocsPath("d:/"); // 生成API 文档所在目录
        config.setAutoGenerate(Boolean.TRUE);  // 配置自动生成
        config.addPlugin(new MarkdownDocPlugin());  //导出markdown
        Docs.buildHtmlDocs(config); // 执行生成文档
    }
}
