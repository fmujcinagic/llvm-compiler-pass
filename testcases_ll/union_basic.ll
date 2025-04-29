; ModuleID = 'testcases/Structs, Unions and Nested Data Types/union_basic.c'
source_filename = "testcases/Structs, Unions and Nested Data Types/union_basic.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.Data = type { i32, [16 x i8] }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [6 x i8] c"Hello\00", align 1, !dbg !7

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !22 {
  %1 = alloca i32, align 4
  %2 = alloca %union.Data, align 4
  %3 = alloca [20 x i8], align 16
  %4 = alloca [20 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !27, !DIExpression(), !35)
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %2), !dbg !36
    #dbg_declare(ptr %3, !37, !DIExpression(), !38)
    #dbg_declare(ptr %4, !39, !DIExpression(), !40)
  %6 = getelementptr inbounds [20 x i8], ptr %3, i64 0, i64 0, !dbg !41
  %7 = getelementptr inbounds [20 x i8], ptr %4, i64 0, i64 0, !dbg !41
  %8 = load i32, ptr %2, align 4, !dbg !42
  %9 = sext i32 %8 to i64, !dbg !43
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %6, ptr align 16 %7, i64 %9, i1 false), !dbg !41
  %10 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 0, !dbg !44
  %11 = call ptr @strcpy(ptr noundef %10, ptr noundef @.str.1) #4, !dbg !45
  ret i32 0, !dbg !46
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!14, !15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 12, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/Structs, Unions and Nested Data Types/union_basic.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "05e406014e9afd489161044f7dda47cb")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 3)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 18, type: !9, isLocal: true, isDefinition: true)
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
!22 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 9, type: !23, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !12, retainedNodes: !26)
!23 = !DISubroutineType(types: !24)
!24 = !{!25}
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !22, file: !2, line: 10, type: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "Data", file: !2, line: 4, size: 160, elements: !29)
!29 = !{!30, !31}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "number", scope: !28, file: !2, line: 5, baseType: !25, size: 32)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "text", scope: !28, file: !2, line: 6, baseType: !32, size: 160)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 160, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 20)
!35 = !DILocation(line: 10, column: 16, scope: !22)
!36 = !DILocation(line: 12, column: 5, scope: !22)
!37 = !DILocalVariable(name: "destination", scope: !22, file: !2, line: 14, type: !32)
!38 = !DILocation(line: 14, column: 10, scope: !22)
!39 = !DILocalVariable(name: "source", scope: !22, file: !2, line: 15, type: !32)
!40 = !DILocation(line: 15, column: 10, scope: !22)
!41 = !DILocation(line: 16, column: 5, scope: !22)
!42 = !DILocation(line: 16, column: 38, scope: !22)
!43 = !DILocation(line: 16, column: 33, scope: !22)
!44 = !DILocation(line: 18, column: 12, scope: !22)
!45 = !DILocation(line: 18, column: 5, scope: !22)
!46 = !DILocation(line: 21, column: 5, scope: !22)
