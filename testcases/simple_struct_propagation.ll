; ModuleID = 'testcases/simple_struct_propagation.c'
source_filename = "testcases/simple_struct_propagation.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Data = type { i32, [100 x i8] }

@.str = private unnamed_addr constant [15 x i8] c"Enter length: \00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [6 x i8] c"Hello\00", align 1, !dbg !12

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !27 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.Data, align 4
  %3 = alloca ptr, align 8
  %4 = alloca [50 x i8], align 16
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !32, !DIExpression(), !40)
    #dbg_declare(ptr %3, !41, !DIExpression(), !43)
  store ptr %2, ptr %3, align 8, !dbg !43
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !44
  %6 = load ptr, ptr %3, align 8, !dbg !45
  %7 = getelementptr inbounds %struct.Data, ptr %6, i32 0, i32 0, !dbg !46
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %7), !dbg !47
  %9 = load ptr, ptr %3, align 8, !dbg !48
  %10 = getelementptr inbounds %struct.Data, ptr %9, i32 0, i32 0, !dbg !49
  %11 = load i32, ptr %10, align 4, !dbg !49
  %12 = getelementptr inbounds %struct.Data, ptr %2, i32 0, i32 0, !dbg !50
  store i32 %11, ptr %12, align 4, !dbg !51
    #dbg_declare(ptr %4, !52, !DIExpression(), !56)
  %13 = getelementptr inbounds [50 x i8], ptr %4, i64 0, i64 0, !dbg !57
  %14 = getelementptr inbounds %struct.Data, ptr %2, i32 0, i32 1, !dbg !58
  %15 = getelementptr inbounds [100 x i8], ptr %14, i64 0, i64 0, !dbg !57
  %16 = getelementptr inbounds %struct.Data, ptr %2, i32 0, i32 0, !dbg !59
  %17 = load i32, ptr %16, align 4, !dbg !59
  %18 = sext i32 %17 to i64, !dbg !60
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %13, ptr align 4 %15, i64 %18, i1 false), !dbg !57
  %19 = load ptr, ptr %3, align 8, !dbg !61
  %20 = getelementptr inbounds %struct.Data, ptr %19, i32 0, i32 1, !dbg !62
  %21 = getelementptr inbounds [100 x i8], ptr %20, i64 0, i64 0, !dbg !61
  %22 = getelementptr inbounds %struct.Data, ptr %2, i32 0, i32 0, !dbg !63
  %23 = load i32, ptr %22, align 4, !dbg !63
  %24 = sext i32 %23 to i64, !dbg !64
  %25 = call ptr @strncpy(ptr noundef %21, ptr noundef @.str.2, i64 noundef %24) #4, !dbg !65
  ret i32 0, !dbg !66
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!17}
!llvm.module.flags = !{!19, !20, !21, !22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 13, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testcases/simple_struct_propagation.c", directory: "/home/faris/Documents/thesis/taint-tracker", checksumkind: CSK_MD5, checksum: "cb90269c24adc9d092114dc9fbb6504f")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 120, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 15)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 14, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 3)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 19, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 48, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 6)
!17 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !18, splitDebugInlining: false, nameTableKind: None)
!18 = !{!0, !7, !12}
!19 = !{i32 7, !"Dwarf Version", i32 5}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 8, !"PIC Level", i32 2}
!23 = !{i32 7, !"PIE Level", i32 2}
!24 = !{i32 7, !"uwtable", i32 2}
!25 = !{i32 7, !"frame-pointer", i32 2}
!26 = !{!"Ubuntu clang version 19.1.7 (++20250114103332+cd708029e0b2-1~exp1~20250114103446.78)"}
!27 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 9, type: !28, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !31)
!28 = !DISubroutineType(types: !29)
!29 = !{!30}
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !{}
!32 = !DILocalVariable(name: "data", scope: !27, file: !2, line: 10, type: !33)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Data", file: !2, line: 4, size: 832, elements: !34)
!34 = !{!35, !36}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !33, file: !2, line: 5, baseType: !30, size: 32)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !33, file: !2, line: 6, baseType: !37, size: 800, offset: 32)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 10, column: 17, scope: !27)
!41 = !DILocalVariable(name: "ptr", scope: !27, file: !2, line: 11, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!43 = !DILocation(line: 11, column: 18, scope: !27)
!44 = !DILocation(line: 13, column: 5, scope: !27)
!45 = !DILocation(line: 14, column: 18, scope: !27)
!46 = !DILocation(line: 14, column: 23, scope: !27)
!47 = !DILocation(line: 14, column: 5, scope: !27)
!48 = !DILocation(line: 15, column: 19, scope: !27)
!49 = !DILocation(line: 15, column: 24, scope: !27)
!50 = !DILocation(line: 15, column: 10, scope: !27)
!51 = !DILocation(line: 15, column: 17, scope: !27)
!52 = !DILocalVariable(name: "destination", scope: !27, file: !2, line: 17, type: !53)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 50)
!56 = !DILocation(line: 17, column: 10, scope: !27)
!57 = !DILocation(line: 18, column: 5, scope: !27)
!58 = !DILocation(line: 18, column: 30, scope: !27)
!59 = !DILocation(line: 18, column: 43, scope: !27)
!60 = !DILocation(line: 18, column: 38, scope: !27)
!61 = !DILocation(line: 19, column: 13, scope: !27)
!62 = !DILocation(line: 19, column: 18, scope: !27)
!63 = !DILocation(line: 19, column: 40, scope: !27)
!64 = !DILocation(line: 19, column: 35, scope: !27)
!65 = !DILocation(line: 19, column: 5, scope: !27)
!66 = !DILocation(line: 21, column: 5, scope: !27)
