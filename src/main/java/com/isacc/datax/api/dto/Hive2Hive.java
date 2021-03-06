package com.isacc.datax.api.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.isacc.datax.domain.entity.datax.BaseDatax;
import com.isacc.datax.domain.entity.reader.hdfsreader.HdfsReader;
import com.isacc.datax.domain.entity.writer.hdfswiter.HdfsWriter;
import lombok.*;

/**
 * <p>
 * Hive2HiveDTO
 * </p>
 *
 * @author isacc 2019/05/07 14:12
 */
@Builder
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Hive2Hive extends BaseDatax {
    /**
     * DataX HdfsReader
     */
    private HdfsReader reader;
    /**
     * DataX HdfsWriter
     */
    private HdfsWriter writer;
    /**
     * csv导入时，csv的本地路径
     */
    private String csvPath;
}
