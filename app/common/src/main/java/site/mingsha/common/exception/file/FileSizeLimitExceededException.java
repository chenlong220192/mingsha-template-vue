package site.mingsha.common.exception.file;

/**
 * 文件名大小限制异常类
 * 
 * @author mingsha
 * @date 2025-07-11
 */
public class FileSizeLimitExceededException extends FileException {
    private static final long serialVersionUID = 1L;

    public FileSizeLimitExceededException(long defaultMaxSize) {
        super("upload.exceed.maxSize", new Object[] { defaultMaxSize });
    }
}
