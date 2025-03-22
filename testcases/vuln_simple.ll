; ModuleID = 'testcases/vuln_simple.c'
source_filename = "testcases/vuln_simple.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [35 x i8] c"User could enter anything, right?\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [24 x i8] c"Now printing new_x: %d\0A\00", align 1, !dbg !12
@.str.3 = private unnamed_addr constant [16 x i8] c"Value of z: %d\0A\00", align 1, !dbg !17

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @vuln() #0 !dbg !32 {
  %1 = alloca i32, align 4
    #dbg_declare(ptr %1, !37, !DIExpression(), !38)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !39
  %3 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %1), !dbg !40
  %4 = load i32, ptr %1, align 4, !dbg !41
  ret i32 %4, !dbg !42
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !43 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca [8 x i8], align 1
  %5 = alloca [8 x i8], align 1
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca [8 x i8], align 1
  %10 = alloca [8 x i8], align 1
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !44, !DIExpression(), !45)
  %11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %2), !dbg !46
    #dbg_declare(ptr %3, !47, !DIExpression(), !48)
  %12 = load i32, ptr %2, align 4, !dbg !49
  %13 = add nsw i32 %12, 26, !dbg !50
  store i32 %13, ptr %3, align 4, !dbg !48
  %14 = load i32, ptr %3, align 4, !dbg !51
  %15 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %14), !dbg !52
    #dbg_declare(ptr %4, !53, !DIExpression(), !57)
    #dbg_declare(ptr %5, !58, !DIExpression(), !59)
  %16 = getelementptr inbounds [8 x i8], ptr %5, i64 0, i64 0, !dbg !60
  %17 = getelementptr inbounds [8 x i8], ptr %4, i64 0, i64 0, !dbg !60
  %18 = load i32, ptr %3, align 4, !dbg !61
  %19 = sext i32 %18 to i64, !dbg !61
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %16, ptr align 1 %17, i64 %19, i1 false), !dbg !60
    #dbg_declare(ptr %6, !62, !DIExpression(), !63)
  %20 = call i32 @vuln(), !dbg !64
  store i32 %20, ptr %6, align 4, !dbg !63
    #dbg_declare(ptr %7, !65, !DIExpression(), !67)
  store ptr %6, ptr %7, align 8, !dbg !67
    #dbg_declare(ptr %8, !68, !DIExpression(), !69)
  %21 = load ptr, ptr %7, align 8, !dbg !70
  %22 = load i32, ptr %21, align 4, !dbg !71
  store i32 %22, ptr %8, align 4, !dbg !69
  %23 = load i32, ptr %8, align 4, !dbg !72
  %24 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %23), !dbg !73
    #dbg_declare(ptr %9, !74, !DIExpression(), !75)
    #dbg_declare(ptr %10, !76, !DIExpression(), !77)
  %25 = getelementptr inbounds [8 x i8], ptr %10, i64 0, i64 0, !dbg !78
  %26 = getelementptr inbounds [8 x i8], ptr %9, i64 0, i64 0, !dbg !78
  %27 = load i32, ptr %6, align 4, !dbg !79
  %28 = sext i32 %27 to i64, !dbg !79
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %25, ptr align 1 %26, i64 %28, i1 false), !dbg !78
  ret i32 0, !dbg !80
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!22}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29, !30}
!llvm.ident = !{!31}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 6, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/vuln_simple.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "f216b417979bb2464fc3d3df04abb4b8")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 280, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 35)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 7, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 3)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 15, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 192, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 24)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(scope: null, file: !2, line: 26, type: !19, isLocal: true, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 16)
!22 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !23, splitDebugInlining: false, nameTableKind: None)
!23 = !{!0, !7, !12, !17}
!24 = !{i32 7, !"Dwarf Version", i32 5}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !{i32 8, !"PIC Level", i32 2}
!28 = !{i32 7, !"PIE Level", i32 2}
!29 = !{i32 7, !"uwtable", i32 2}
!30 = !{i32 7, !"frame-pointer", i32 2}
!31 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!32 = distinct !DISubprogram(name: "vuln", scope: !2, file: !2, line: 4, type: !33, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !22, retainedNodes: !36)
!33 = !DISubroutineType(types: !34)
!34 = !{!35}
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !{}
!37 = !DILocalVariable(name: "x", scope: !32, file: !2, line: 5, type: !35)
!38 = !DILocation(line: 5, column: 9, scope: !32)
!39 = !DILocation(line: 6, column: 5, scope: !32)
!40 = !DILocation(line: 7, column: 5, scope: !32)
!41 = !DILocation(line: 8, column: 12, scope: !32)
!42 = !DILocation(line: 8, column: 5, scope: !32)
!43 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 11, type: !33, scopeLine: 11, spFlags: DISPFlagDefinition, unit: !22, retainedNodes: !36)
!44 = !DILocalVariable(name: "x", scope: !43, file: !2, line: 12, type: !35)
!45 = !DILocation(line: 12, column: 9, scope: !43)
!46 = !DILocation(line: 13, column: 5, scope: !43)
!47 = !DILocalVariable(name: "new_x", scope: !43, file: !2, line: 14, type: !35)
!48 = !DILocation(line: 14, column: 9, scope: !43)
!49 = !DILocation(line: 14, column: 17, scope: !43)
!50 = !DILocation(line: 14, column: 19, scope: !43)
!51 = !DILocation(line: 15, column: 40, scope: !43)
!52 = !DILocation(line: 15, column: 5, scope: !43)
!53 = !DILocalVariable(name: "source", scope: !43, file: !2, line: 19, type: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 8)
!57 = !DILocation(line: 19, column: 10, scope: !43)
!58 = !DILocalVariable(name: "destination", scope: !43, file: !2, line: 20, type: !54)
!59 = !DILocation(line: 20, column: 10, scope: !43)
!60 = !DILocation(line: 21, column: 5, scope: !43)
!61 = !DILocation(line: 21, column: 33, scope: !43)
!62 = !DILocalVariable(name: "tainted_y", scope: !43, file: !2, line: 23, type: !35)
!63 = !DILocation(line: 23, column: 9, scope: !43)
!64 = !DILocation(line: 23, column: 21, scope: !43)
!65 = !DILocalVariable(name: "ptr", scope: !43, file: !2, line: 24, type: !66)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!67 = !DILocation(line: 24, column: 10, scope: !43)
!68 = !DILocalVariable(name: "z", scope: !43, file: !2, line: 25, type: !35)
!69 = !DILocation(line: 25, column: 9, scope: !43)
!70 = !DILocation(line: 25, column: 14, scope: !43)
!71 = !DILocation(line: 25, column: 13, scope: !43)
!72 = !DILocation(line: 26, column: 32, scope: !43)
!73 = !DILocation(line: 26, column: 5, scope: !43)
!74 = !DILocalVariable(name: "source2", scope: !43, file: !2, line: 28, type: !54)
!75 = !DILocation(line: 28, column: 10, scope: !43)
!76 = !DILocalVariable(name: "destination2", scope: !43, file: !2, line: 29, type: !54)
!77 = !DILocation(line: 29, column: 10, scope: !43)
!78 = !DILocation(line: 30, column: 5, scope: !43)
!79 = !DILocation(line: 30, column: 35, scope: !43)
!80 = !DILocation(line: 31, column: 5, scope: !43)
