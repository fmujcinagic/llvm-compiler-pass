; ModuleID = 'testcases/Structs, Unions and Nested Data Types/union_struct_pointer.c'
source_filename = "testcases/Structs, Unions and Nested Data Types/union_struct_pointer.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Wrapper = type { %union.U }
%union.U = type { i32, [96 x i8] }

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !30 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca [100 x i8], align 16
  %4 = alloca [100 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !34, !DIExpression(), !35)
  %5 = call noalias ptr @malloc(i64 noundef 100) #4, !dbg !36
  store ptr %5, ptr %2, align 8, !dbg !35
  %6 = load ptr, ptr %2, align 8, !dbg !37
  %7 = getelementptr inbounds %struct.Wrapper, ptr %6, i32 0, i32 0, !dbg !38
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str, ptr noundef %7), !dbg !39
    #dbg_declare(ptr %3, !40, !DIExpression(), !41)
    #dbg_declare(ptr %4, !42, !DIExpression(), !43)
  %9 = getelementptr inbounds [100 x i8], ptr %4, i64 0, i64 0, !dbg !44
  %10 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0, !dbg !44
  %11 = load ptr, ptr %2, align 8, !dbg !45
  %12 = getelementptr inbounds %struct.Wrapper, ptr %11, i32 0, i32 0, !dbg !46
  %13 = load i32, ptr %12, align 4, !dbg !47
  %14 = sext i32 %13 to i64, !dbg !45
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %9, ptr align 16 %10, i64 %14, i1 false), !dbg !44
  ret i32 0, !dbg !48
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind allocsize(0) }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 15, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/Structs, Unions and Nested Data Types/union_struct_pointer.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "9eb3b48891d99413f1a6481d0cac4b8f")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 3)
!7 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !8, globals: !21, splitDebugInlining: false, nameTableKind: None)
!8 = !{!9}
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Wrapper", file: !2, line: 9, size: 800, elements: !11)
!11 = !{!12}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !10, file: !2, line: 10, baseType: !13, size: 800)
!13 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "U", file: !2, line: 4, size: 800, elements: !14)
!14 = !{!15, !17}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !13, file: !2, line: 5, baseType: !16, size: 32)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "buf", scope: !13, file: !2, line: 6, baseType: !18, size: 800)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 100)
!21 = !{!0}
!22 = !{i32 7, !"Dwarf Version", i32 5}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 8, !"PIC Level", i32 2}
!26 = !{i32 7, !"PIE Level", i32 2}
!27 = !{i32 7, !"uwtable", i32 2}
!28 = !{i32 7, !"frame-pointer", i32 2}
!29 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!30 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 13, type: !31, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !33)
!31 = !DISubroutineType(types: !32)
!32 = !{!16}
!33 = !{}
!34 = !DILocalVariable(name: "w", scope: !30, file: !2, line: 14, type: !9)
!35 = !DILocation(line: 14, column: 21, scope: !30)
!36 = !DILocation(line: 14, column: 43, scope: !30)
!37 = !DILocation(line: 15, column: 18, scope: !30)
!38 = !DILocation(line: 15, column: 21, scope: !30)
!39 = !DILocation(line: 15, column: 5, scope: !30)
!40 = !DILocalVariable(name: "src", scope: !30, file: !2, line: 17, type: !18)
!41 = !DILocation(line: 17, column: 10, scope: !30)
!42 = !DILocalVariable(name: "dest", scope: !30, file: !2, line: 17, type: !18)
!43 = !DILocation(line: 17, column: 20, scope: !30)
!44 = !DILocation(line: 18, column: 5, scope: !30)
!45 = !DILocation(line: 18, column: 23, scope: !30)
!46 = !DILocation(line: 18, column: 26, scope: !30)
!47 = !DILocation(line: 18, column: 28, scope: !30)
!48 = !DILocation(line: 20, column: 5, scope: !30)
