//
//  NSFileManager+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSFileManager+SYCategory.h"

@implementation NSFileManager (SYCategory)

/// 获取程序的Home目录路径
+ (NSString *)GetHomeDirectoryPath
{
    return NSHomeDirectory();
}

/// 获取document目录路径
+ (NSString *)GetDocumentPath
{
    NSArray *Paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [Paths objectAtIndex:0];
    return path;
}

/// 获取Cache目录路径
+ (NSString *)GetCachePath
{
    NSArray *Paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [Paths objectAtIndex:0];
    return path;
}

/// 获取Library目录路径
+ (NSString *)GetLibraryPath
{
    NSArray *Paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = [Paths objectAtIndex:0];
    return path;
}

/// 获取Tmp目录路径
+ (NSString *)GetTmpPath
{
    return NSTemporaryDirectory();
}

/// 返回Documents下的指定文件路径(加创建)
+ (NSString *)GetDirectoryForDocuments:(NSString *)dir
{
    NSError *error;
    NSString *path = [[self GetDocumentPath] stringByAppendingPathComponent:dir];
    if (![[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error])
    {
        NSLog(@"create dir error: %@",error.debugDescription);
    }
    return path;
}

/// 返回Caches下的指定文件路径
+ (NSString *)GetDirectoryForCaches:(NSString *)dir
{
    NSError *error;
    NSString *path = [[self GetCachePath] stringByAppendingPathComponent:dir];
    
    if (![[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error])
    {
        NSLog(@"create dir error: %@",error.debugDescription);
    }
    return path;
}

/// 创建目录文件夹
+ (NSString *)CreateList:(NSString *)List ListName:(NSString *)Name
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *FileDirectory = [List stringByAppendingPathComponent:Name];
    if ([self IsFileExists:Name])
    {
        NSLog(@"exist,%@", Name);
    }
    else
    {
        [fileManager createDirectoryAtPath:FileDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return FileDirectory;
}

/// 写入NsArray文件
+ (BOOL)WriteFileArray:(NSArray *)ArrarObject SpecifiedFile:(NSString *)path
{
    return [ArrarObject writeToFile:path atomically:YES];
}

/// 写入NSDictionary文件
+ (BOOL)WriteFileDictionary:(NSMutableDictionary *)DictionaryObject SpecifiedFile:(NSString *)path
{
    return [DictionaryObject writeToFile:path atomically:YES];
}

/// 是否存在该文件
+ (BOOL)IsFileExists:(NSString *)filepath
{
    return [[NSFileManager defaultManager] fileExistsAtPath:filepath];
}

/// 删除指定文件
+ (void)DeleteFile:(NSString *)filepath
{
    if([[NSFileManager defaultManager] fileExistsAtPath:filepath])
    {
        [[NSFileManager defaultManager] removeItemAtPath:filepath error:nil];
    }
}

/// 获取目录列表里所有的文件名
+ (NSArray *)GetSubpathsAtPath:(NSString *)path
{
    NSFileManager *fileManage = [NSFileManager defaultManager];
    NSArray *file = [fileManage subpathsAtPath:path];
    return file;
}

+ (void)deleteAllForDocumentsDir:(NSString *)dir
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:[self GetDirectoryForDocuments:dir] error:nil];
    for (NSString *filename in fileList)
    {
        [fileManager removeItemAtPath:[self GetPathForDocuments:filename inDir:dir] error:nil];
    }
}

+ (void)deleteAllForCachesDir:(NSString *)dir
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:[self GetDirectoryForCaches:dir] error:nil];
    for (NSString *filename in fileList)
    {
        [fileManager removeItemAtPath:[self GetPathForCaches:filename inDir:dir] error:nil];
    }
}

/// 改名
+ (BOOL)renameForPath:(NSString *)oldPath newName:(NSString *)newName
{
    NSString *newPath = [[oldPath stringByDeletingLastPathComponent] stringByAppendingPathComponent:newName];
    return [[NSFileManager defaultManager] moveItemAtPath:oldPath toPath:newPath error:nil];
}

/// 获取文件的数据
+ (NSData *)GetDataForPath:(NSString *)path
{
    return [[NSFileManager defaultManager] contentsAtPath:path];
}

+ (NSData *)GetDataForResource:(NSString *)name inDir:(NSString *)dir
{
    return [self GetDataForPath:[self GetPathForResource:name inDir:dir]];
}

+ (NSData *)GetDataForDocuments:(NSString *)name inDir:(NSString *)dir
{
    return [self GetDataForPath:[self GetPathForDocuments:name inDir:dir]];
}

/// 获取文件路径
+ (NSString *)GetPathForResource:(NSString *)name
{
    return [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:name];
}

+ (NSString *)GetPathForResource:(NSString *)name inDir:(NSString *)dir
{
    return [[[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:dir] stringByAppendingPathComponent:name];
}

+ (NSString *)GetPathForDocuments:(NSString *)filename
{
    return [[self GetDocumentPath] stringByAppendingPathComponent:filename];
}

+ (NSString *)GetPathForDocuments:(NSString *)filename inDir:(NSString *)dir
{
    return [[self GetDirectoryForDocuments:dir] stringByAppendingPathComponent:filename];
}

+ (NSString *)GetPathForCaches:(NSString *)filename
{
    return [[self GetCachePath] stringByAppendingPathComponent:filename];
}

+ (NSString *)GetPathForCaches:(NSString *)filename inDir:(NSString *)dir
{
    return [[self GetDirectoryForCaches:dir] stringByAppendingPathComponent:filename];
}

/// 单个文件的大小
+ (long long)fileSizeAtPath:(NSString*)filePath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath])
    {
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

/// 遍历文件夹获得文件夹大小，返回多少M
+ (float)folderSizeAtPath:(NSString *)folderPath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString *fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil)
    {
        NSString *fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize / (1024.0 * 1024.0);
}


/**
 *  磁盘总空间大小
 *
 *  @return float 字节
 */
+ (CGFloat)sizeBytesAllFiles
{
    CGFloat size = 0.0;
    NSError *error;
    
    NSDictionary *dict = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error)
    {
        size = 0.0;
        
//#ifdef DEBUG
//        NSLog(@"error=%@",error.localizedDescription);
//#endif
    }
    else
    {
        NSNumber *sizeNumber = [dict objectForKey:NSFileSystemSize];
        size = sizeNumber.floatValue;
    }
    
    return size;
}

/**
 *  磁盘可用空间大小
 *
 *  @return float 字节
 */
+ (CGFloat)sizeBytesFree
{
    CGFloat size = 0.0;
    NSError *error;
    
    NSDictionary *dict = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error)
    {
        size = 0.0;
    }
    else
    {
        NSNumber *sizeNumber = [dict objectForKey:NSFileSystemFreeSize];
        size = sizeNumber.floatValue;
    }
    
    return size;
}

/**
 *  指定路径下某个文件的大小
 *
 *  @param filePath 指定路径的文件
 *
 *  @return long long 大小
 */
+ (long long)sizeBytesWithFilePath:(NSString *)filePath
{
    long long size = 0;

    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    if (isExist)
    {
        NSError *error;
        NSDictionary *dict = [fileManager attributesOfItemAtPath:filePath error:&error];
        if (error)
        {
            size = 0;
        }
        else
        {
            size = [dict fileSize];
        }
    }
    
    return size;
}

/**
 *  指定路径下所有文件的大小
 *
 *  @param fileFolder 指定路径
 *
 *  @return long long 大小
 */
+ (long long)sizeBytesWithFileFolder:(NSString *)fileFolder
{
    long long size = 0;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist = [fileManager fileExistsAtPath:fileFolder];
    if (isExist)
    {
        NSArray *fileArray = [fileManager subpathsAtPath:fileFolder];
        NSEnumerator *fileEnumerator = [fileArray objectEnumerator];
        NSString *fileName;
        while ((fileName = [fileEnumerator nextObject]) != nil)
        {
            NSString *filePath = [fileFolder stringByAppendingPathComponent:fileName];
            long long sizeFile = [self sizeBytesWithFilePath:filePath];
            size += sizeFile;
        }
    }
    
    return size;
}


/// 当前上传文件名称（无类型后缀。以时间命名 yyyyMMddHHmmssSSS）
+ (NSString *)getFileName
{
    NSDate *date = [NSDate date];
    NSString *format = @"yyyyMMddHHmmssSSS";
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    
    NSString *fileName = [formatter stringFromDate:date];
    
    return fileName;
}

/// 当前上传文件路径（保存在本地的路径）
+ (NSString *)getFilePathWithName:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDirectory = [paths objectAtIndex:0];
    NSString *fullPathToFile = [cachesDirectory stringByAppendingPathComponent:fileName];
    return fullPathToFile;
}

/// 当前上传文件保存在本地
+ (BOOL)saveImageFile:(UIImage *)image filePath:(NSString *)filePath
{
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    BOOL isResult = [imageData writeToFile:filePath atomically:NO];
    return isResult;
}

/// 文件删除（NSDictionary-value为文件路径）
+ (void)deleteFile:(NSDictionary *)fileDict
{
    if (fileDict)
    {
        [fileDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            if([[NSFileManager defaultManager]fileExistsAtPath:obj])
            {
                [[NSFileManager defaultManager] removeItemAtPath:obj error:nil];
            }
        }];
    }
}

@end
