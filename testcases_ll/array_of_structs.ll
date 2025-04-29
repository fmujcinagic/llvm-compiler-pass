; ModuleID = 'testcases/Structs, Unions and Nested Data Types/array_of_structs.c'
source_filename = "testcases/Structs, Unions and Nested Data Types/array_of_structs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Item = type { i32, [20 x i8] }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !17 {
  %1 = alloca i32, align 4
  %2 = alloca [3 x %struct.Item], align 16
  %3 = alloca [20 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !22, !DIExpression(), !31)
  %4 = getelementptr inbounds [3 x %struct.Item], ptr %2, i64 0, i64 1, !dbg !32
  %5 = getelementptr inbounds %struct.Item, ptr %4, i32 0, i32 0, !dbg !33
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %5), !dbg !34
    #dbg_declare(ptr %3, !35, !DIExpression(), !36)
  %7 = getelementptr inbounds [20 x i8], ptr %3, i64 0, i64 0, !dbg !37
  %8 = getelementptr inbounds [3 x %struct.Item], ptr %2, i64 0, i64 1, !dbg !38
  %9 = getelementptr inbounds %struct.Item, ptr %8, i32 0, i32 1, !dbg !39
  %10 = getelementptr inbounds [20 x i8], ptr %9, i64 0, i64 0, !dbg !37
  %11 = getelementptr inbounds [3 x %struct.Item], ptr %2, i64 0, i64 1, !dbg !40
  %12 = getelementptr inbounds %struct.Item, ptr %11, i32 0, i32 0, !dbg !41
  %13 = load i32, ptr %12, align 8, !dbg !41
  %14 = sext i32 %13 to i64, !dbg !40
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %7, ptr align 4 %10, i64 %14, i1 false), !dbg !37
  %15 = getelementptr inbounds [20 x i8], ptr %3, i64 0, i64 0, !dbg !42
  %16 = getelementptr inbounds [3 x %struct.Item], ptr %2, i64 0, i64 0, !dbg !43
  %17 = getelementptr inbounds %struct.Item, ptr %16, i32 0, i32 1, !dbg !44
  %18 = getelementptr inbounds [20 x i8], ptr %17, i64 0, i64 0, !dbg !42
  %19 = getelementptr inbounds [3 x %struct.Item], ptr %2, i64 0, i64 0, !dbg !45
  %20 = getelementptr inbounds %struct.Item, ptr %19, i32 0, i32 0, !dbg !46
  %21 = load i32, ptr %20, align 16, !dbg !46
  %22 = sext i32 %21 to i64, !dbg !45
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %15, ptr align 4 %18, i64 %22, i1 false), !dbg !42
  ret i32 0, !dbg !47
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 11, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/Structs, Unions and Nested Data Types/array_of_structs.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "0b80dfce4beb1e30493887d37dcf7c54")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 3)
!7 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !8, splitDebugInlining: false, nameTableKind: None)
!8 = !{!0}
!9 = !{i32 7, !"Dwarf Version", i32 5}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 8, !"PIC Level", i32 2}
!13 = !{i32 7, !"PIE Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 2}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!17 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 9, type: !18, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!18 = !DISubroutineType(types: !19)
!19 = !{!20}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{}
!22 = !DILocalVariable(name: "items", scope: !17, file: !2, line: 10, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 576, elements: !5)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Item", file: !2, line: 4, size: 192, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !24, file: !2, line: 5, baseType: !20, size: 32)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !24, file: !2, line: 6, baseType: !28, size: 160, offset: 32)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 160, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 20)
!31 = !DILocation(line: 10, column: 17, scope: !17)
!32 = !DILocation(line: 11, column: 18, scope: !17)
!33 = !DILocation(line: 11, column: 27, scope: !17)
!34 = !DILocation(line: 11, column: 5, scope: !17)
!35 = !DILocalVariable(name: "dest", scope: !17, file: !2, line: 13, type: !28)
!36 = !DILocation(line: 13, column: 10, scope: !17)
!37 = !DILocation(line: 14, column: 5, scope: !17)
!38 = !DILocation(line: 14, column: 18, scope: !17)
!39 = !DILocation(line: 14, column: 27, scope: !17)
!40 = !DILocation(line: 14, column: 33, scope: !17)
!41 = !DILocation(line: 14, column: 42, scope: !17)
!42 = !DILocation(line: 15, column: 5, scope: !17)
!43 = !DILocation(line: 15, column: 18, scope: !17)
!44 = !DILocation(line: 15, column: 27, scope: !17)
!45 = !DILocation(line: 15, column: 33, scope: !17)
!46 = !DILocation(line: 15, column: 42, scope: !17)
!47 = !DILocation(line: 17, column: 5, scope: !17)
