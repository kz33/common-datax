{
  "job": {
    "setting": {
      "speed": {
        "channel": ${(setting.speed.channel)!"3"}
      },
      "errorLimit": {
        "record": ${(setting.errorLimit.record)!"0"},
        "percentage": ${(setting.errorLimit.percentage)!"0.02"}
      }
    },
    "content": [
      {
        "reader": {
          "name": "oraclereader",
          "parameter": {
            "username": "${oraclereaderUsername}",
            "password": "${oraclereaderPassword}",
            "splitPk": "${oraclereaderSplitPk!}",
            "connection": [
              <#list oraclereaderConnection as conn>
                {
                "querySql": [
                  <#list conn.querySql as sql>
                    "${sql}"<#if sql_has_next>,</#if>
                  </#list>
                ],
                "jdbcUrl": [
                  <#list conn.jdbcUrl as url>
                    "${url}"<#if url_has_next>,</#if>
                  </#list>
                ]
                }<#if conn_has_next>,</#if>
              </#list>
            ],
            "fetchSize": ${oraclereaderFetchSize!'1024'},
            "session": [
              <#if  oracleReaderSession??>
                <#list oracleReaderSession as session>
                  "${session}"<#if session_has_next>,</#if>
                </#list>
              </#if>
            ]
          }
        },
        "writer": {
          "name": "oraclewriter",
          "parameter": {
            "username": "${oraclewriterUsername}",
            "password": "${oraclewriterPassword}",
            "batchSize": ${oraclewriterBatchSize!'1024'},
            "column": [
              <#list oraclewriterColumn as column>
                "${column}"<#if column_has_next>,</#if>
              </#list>
            ],
            "session": [
              <#if oraclewriterSession??>
                <#list oraclewriterSession as session>
                  "${session}"<#if session_has_next>,</#if>
                </#list>
              </#if>
            ],
            "preSql": [
              <#if oraclewriterPreSql??>
                <#list oraclewriterPreSql as preSql>
                  "${preSql}"<#if preSql_has_next>,</#if>
                </#list>
              </#if>
            ],
            "connection": [
              <#list oraclewriterConnection as conn>
                {
                "table": [
                  <#list conn.table as tbl>
                    "${tbl}"<#if tbl_has_next>,</#if>
                  </#list>
                ],
                "jdbcUrl": "${conn.jdbcUrl}"
                }<#if conn_has_next>,</#if>
              </#list>
            ],
            "postSql": [
              <#if  oraclewriterPostSql??>
                <#list oraclewriterPostSql as postSql>
                  "${postSql}"<#if postSql_has_next>,</#if>
                </#list>
              </#if>
            ]
          }
        }
      }
    ]
  }
}