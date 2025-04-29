; ModuleID = 'testcases/binary_operations.c'
source_filename = "testcases/binary_operations.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [6 x i8] c"Hello\00", align 1, !dbg !7
@__const.main.src = private unnamed_addr constant [22 x i8] c"this is a test string\00", align 16
@stdin = external global ptr, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !22 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [100 x i8], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca [50 x i8], align 16
  %17 = alloca [22 x i8], align 16
  %18 = alloca [100 x i8], align 16
  %19 = alloca i32, align 4
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !27, !DIExpression(), !28)
    #dbg_declare(ptr %3, !29, !DIExpression(), !33)
  %20 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %2), !dbg !34
    #dbg_declare(ptr %4, !35, !DIExpression(), !36)
  %21 = load i32, ptr %2, align 4, !dbg !37
  %22 = add nsw i32 %21, 10, !dbg !38
  store i32 %22, ptr %4, align 4, !dbg !36
    #dbg_declare(ptr %5, !39, !DIExpression(), !40)
  %23 = load i32, ptr %2, align 4, !dbg !41
  %24 = mul nsw i32 %23, 2, !dbg !42
  store i32 %24, ptr %5, align 4, !dbg !40
    #dbg_declare(ptr %6, !43, !DIExpression(), !44)
  %25 = load i32, ptr %2, align 4, !dbg !45
  %26 = sub nsw i32 %25, 5, !dbg !46
  store i32 %26, ptr %6, align 4, !dbg !44
    #dbg_declare(ptr %7, !47, !DIExpression(), !48)
  %27 = load i32, ptr %2, align 4, !dbg !49
  %28 = sdiv i32 %27, 2, !dbg !50
  store i32 %28, ptr %7, align 4, !dbg !48
    #dbg_declare(ptr %8, !51, !DIExpression(), !52)
  %29 = load i32, ptr %2, align 4, !dbg !53
  %30 = srem i32 %29, 10, !dbg !54
  store i32 %30, ptr %8, align 4, !dbg !52
    #dbg_declare(ptr %9, !55, !DIExpression(), !56)
  %31 = load i32, ptr %2, align 4, !dbg !57
  %32 = shl i32 %31, 2, !dbg !58
  store i32 %32, ptr %9, align 4, !dbg !56
    #dbg_declare(ptr %10, !59, !DIExpression(), !60)
  %33 = load i32, ptr %2, align 4, !dbg !61
  %34 = ashr i32 %33, 1, !dbg !62
  store i32 %34, ptr %10, align 4, !dbg !60
    #dbg_declare(ptr %11, !63, !DIExpression(), !64)
  %35 = load i32, ptr %2, align 4, !dbg !65
  %36 = and i32 %35, 255, !dbg !66
  store i32 %36, ptr %11, align 4, !dbg !64
    #dbg_declare(ptr %12, !67, !DIExpression(), !68)
  %37 = load i32, ptr %2, align 4, !dbg !69
  %38 = or i32 %37, 256, !dbg !70
  store i32 %38, ptr %12, align 4, !dbg !68
    #dbg_declare(ptr %13, !71, !DIExpression(), !72)
  %39 = load i32, ptr %2, align 4, !dbg !73
  %40 = xor i32 %39, 61680, !dbg !74
  store i32 %40, ptr %13, align 4, !dbg !72
    #dbg_declare(ptr %14, !75, !DIExpression(), !76)
  %41 = load i32, ptr %2, align 4, !dbg !77
  %42 = add nsw i32 %41, 5, !dbg !78
  %43 = mul nsw i32 %42, 2, !dbg !79
  store i32 %43, ptr %14, align 4, !dbg !76
    #dbg_declare(ptr %15, !80, !DIExpression(), !81)
  %44 = load i32, ptr %2, align 4, !dbg !82
  %45 = and i32 %44, 255, !dbg !83
  %46 = shl i32 %45, 2, !dbg !84
  %47 = add nsw i32 %46, 10, !dbg !85
  store i32 %47, ptr %15, align 4, !dbg !81
  %48 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0, !dbg !86
  %49 = load i32, ptr %5, align 4, !dbg !87
  %50 = sext i32 %49 to i64, !dbg !87
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %48, ptr align 1 @.str.1, i64 %50, i1 false), !dbg !86
  %51 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0, !dbg !88
  %52 = load i32, ptr %6, align 4, !dbg !89
  %53 = sext i32 %52 to i64, !dbg !89
  call void @llvm.memset.p0.i64(ptr align 16 %51, i8 65, i64 %53, i1 false), !dbg !88
    #dbg_declare(ptr %16, !90, !DIExpression(), !94)
    #dbg_declare(ptr %17, !95, !DIExpression(), !99)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %17, ptr align 16 @__const.main.src, i64 22, i1 false), !dbg !99
  %54 = getelementptr inbounds [50 x i8], ptr %16, i64 0, i64 0, !dbg !100
  %55 = getelementptr inbounds [22 x i8], ptr %17, i64 0, i64 0, !dbg !101
  %56 = load i32, ptr %11, align 4, !dbg !102
  %57 = sext i32 %56 to i64, !dbg !102
  %58 = call ptr @strncpy(ptr noundef %54, ptr noundef %55, i64 noundef %57) #6, !dbg !103
    #dbg_declare(ptr %18, !104, !DIExpression(), !105)
  %59 = getelementptr inbounds [100 x i8], ptr %18, i64 0, i64 0, !dbg !106
  %60 = load i32, ptr %14, align 4, !dbg !107
  %61 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %59, ptr noundef @.str, i32 noundef %60) #6, !dbg !108
  %62 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0, !dbg !109
  %63 = load ptr, ptr @stdin, align 8, !dbg !110
  %64 = call ptr @fgets(ptr noundef %62, i32 noundef 100, ptr noundef %63), !dbg !111
    #dbg_declare(ptr %19, !112, !DIExpression(), !113)
  %65 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0, !dbg !114
  %66 = call i32 @atoi(ptr noundef %65) #7, !dbg !115
  %67 = add nsw i32 %66, 10, !dbg !116
  store i32 %67, ptr %19, align 4, !dbg !113
  %68 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0, !dbg !117
  %69 = load i32, ptr %19, align 4, !dbg !118
  %70 = sext i32 %69 to i64, !dbg !118
  %71 = call i64 @write(i32 noundef 1, ptr noundef %68, i64 noundef %70), !dbg !119
  ret i32 0, !dbg !120
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #4

; Function Attrs: nounwind
declare i32 @sprintf(ptr noundef, ptr noundef, ...) #4

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(read)
declare i32 @atoi(ptr noundef) #5

declare i64 @write(i32 noundef, ptr noundef, i64 noundef) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind willreturn memory(read) }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!14, !15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 10, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/binary_operations.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "ff0a68847100e954c8b638f2da3a99f3")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 3)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 29, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 48, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 6)
!12 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !13, splitDebugInlining: false, nameTableKind: None)
!13 = !{!0, !7}
!14 = !{i32 7, !"Dwarf Version", i32 5}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 8, !"PIC Level", i32 2}
!18 = !{i32 7, !"PIE Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 2}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!22 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 6, type: !23, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !26)
!23 = !DISubroutineType(types: !24)
!24 = !{!25}
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !{}
!27 = !DILocalVariable(name: "user_input", scope: !22, file: !2, line: 7, type: !25)
!28 = !DILocation(line: 7, column: 9, scope: !22)
!29 = !DILocalVariable(name: "buffer", scope: !22, file: !2, line: 8, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 8, column: 10, scope: !22)
!34 = !DILocation(line: 10, column: 5, scope: !22)
!35 = !DILocalVariable(name: "calculated_size", scope: !22, file: !2, line: 12, type: !25)
!36 = !DILocation(line: 12, column: 9, scope: !22)
!37 = !DILocation(line: 12, column: 27, scope: !22)
!38 = !DILocation(line: 12, column: 38, scope: !22)
!39 = !DILocalVariable(name: "multiple_size", scope: !22, file: !2, line: 13, type: !25)
!40 = !DILocation(line: 13, column: 9, scope: !22)
!41 = !DILocation(line: 13, column: 25, scope: !22)
!42 = !DILocation(line: 13, column: 36, scope: !22)
!43 = !DILocalVariable(name: "offset", scope: !22, file: !2, line: 14, type: !25)
!44 = !DILocation(line: 14, column: 9, scope: !22)
!45 = !DILocation(line: 14, column: 18, scope: !22)
!46 = !DILocation(line: 14, column: 29, scope: !22)
!47 = !DILocalVariable(name: "scaled_value", scope: !22, file: !2, line: 15, type: !25)
!48 = !DILocation(line: 15, column: 9, scope: !22)
!49 = !DILocation(line: 15, column: 24, scope: !22)
!50 = !DILocation(line: 15, column: 35, scope: !22)
!51 = !DILocalVariable(name: "remainder", scope: !22, file: !2, line: 16, type: !25)
!52 = !DILocation(line: 16, column: 9, scope: !22)
!53 = !DILocation(line: 16, column: 21, scope: !22)
!54 = !DILocation(line: 16, column: 32, scope: !22)
!55 = !DILocalVariable(name: "shifted", scope: !22, file: !2, line: 18, type: !25)
!56 = !DILocation(line: 18, column: 9, scope: !22)
!57 = !DILocation(line: 18, column: 19, scope: !22)
!58 = !DILocation(line: 18, column: 30, scope: !22)
!59 = !DILocalVariable(name: "right_shifted", scope: !22, file: !2, line: 19, type: !25)
!60 = !DILocation(line: 19, column: 9, scope: !22)
!61 = !DILocation(line: 19, column: 25, scope: !22)
!62 = !DILocation(line: 19, column: 36, scope: !22)
!63 = !DILocalVariable(name: "bitwise_and", scope: !22, file: !2, line: 20, type: !25)
!64 = !DILocation(line: 20, column: 9, scope: !22)
!65 = !DILocation(line: 20, column: 23, scope: !22)
!66 = !DILocation(line: 20, column: 34, scope: !22)
!67 = !DILocalVariable(name: "bitwise_or", scope: !22, file: !2, line: 21, type: !25)
!68 = !DILocation(line: 21, column: 9, scope: !22)
!69 = !DILocation(line: 21, column: 22, scope: !22)
!70 = !DILocation(line: 21, column: 33, scope: !22)
!71 = !DILocalVariable(name: "bitwise_xor", scope: !22, file: !2, line: 22, type: !25)
!72 = !DILocation(line: 22, column: 9, scope: !22)
!73 = !DILocation(line: 22, column: 23, scope: !22)
!74 = !DILocation(line: 22, column: 34, scope: !22)
!75 = !DILocalVariable(name: "compound_value", scope: !22, file: !2, line: 24, type: !25)
!76 = !DILocation(line: 24, column: 9, scope: !22)
!77 = !DILocation(line: 24, column: 27, scope: !22)
!78 = !DILocation(line: 24, column: 38, scope: !22)
!79 = !DILocation(line: 24, column: 43, scope: !22)
!80 = !DILocalVariable(name: "nested_op", scope: !22, file: !2, line: 25, type: !25)
!81 = !DILocation(line: 25, column: 9, scope: !22)
!82 = !DILocation(line: 25, column: 23, scope: !22)
!83 = !DILocation(line: 25, column: 34, scope: !22)
!84 = !DILocation(line: 25, column: 42, scope: !22)
!85 = !DILocation(line: 25, column: 48, scope: !22)
!86 = !DILocation(line: 29, column: 5, scope: !22)
!87 = !DILocation(line: 29, column: 29, scope: !22)
!88 = !DILocation(line: 30, column: 5, scope: !22)
!89 = !DILocation(line: 30, column: 25, scope: !22)
!90 = !DILocalVariable(name: "dest", scope: !22, file: !2, line: 32, type: !91)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !92)
!92 = !{!93}
!93 = !DISubrange(count: 50)
!94 = !DILocation(line: 32, column: 10, scope: !22)
!95 = !DILocalVariable(name: "src", scope: !22, file: !2, line: 33, type: !96)
!96 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 176, elements: !97)
!97 = !{!98}
!98 = !DISubrange(count: 22)
!99 = !DILocation(line: 33, column: 10, scope: !22)
!100 = !DILocation(line: 34, column: 13, scope: !22)
!101 = !DILocation(line: 34, column: 19, scope: !22)
!102 = !DILocation(line: 34, column: 24, scope: !22)
!103 = !DILocation(line: 34, column: 5, scope: !22)
!104 = !DILocalVariable(name: "format_buffer", scope: !22, file: !2, line: 36, type: !30)
!105 = !DILocation(line: 36, column: 10, scope: !22)
!106 = !DILocation(line: 37, column: 13, scope: !22)
!107 = !DILocation(line: 37, column: 34, scope: !22)
!108 = !DILocation(line: 37, column: 5, scope: !22)
!109 = !DILocation(line: 39, column: 11, scope: !22)
!110 = !DILocation(line: 39, column: 24, scope: !22)
!111 = !DILocation(line: 39, column: 5, scope: !22)
!112 = !DILocalVariable(name: "manipulated_fd", scope: !22, file: !2, line: 40, type: !25)
!113 = !DILocation(line: 40, column: 9, scope: !22)
!114 = !DILocation(line: 40, column: 31, scope: !22)
!115 = !DILocation(line: 40, column: 26, scope: !22)
!116 = !DILocation(line: 40, column: 39, scope: !22)
!117 = !DILocation(line: 41, column: 14, scope: !22)
!118 = !DILocation(line: 41, column: 22, scope: !22)
!119 = !DILocation(line: 41, column: 5, scope: !22)
!120 = !DILocation(line: 43, column: 5, scope: !22)
