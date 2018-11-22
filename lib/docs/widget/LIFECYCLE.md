State 生命周期: 

# initState()
state create之后被insert到tree时调用的

# didChangeDependencies()
初始化时, 在initState()之后立刻调用, 当依赖的InheritedWidget rebuild, 会触发此接口被调用

#didUpdateWidget(newWidget)
祖先节点rebuild widget时调用

# deactivate()
widget被remove的时候调用, 一个widget从tree中remove掉, 可以在dispose接口被调用前, 重新instert到一个新tree中

# build()

# dispose()
Widget彻底销毁时调用

# reassemble()
hot reload调用

# 注意事项：

1. A页面push一个新的页面B,A页面的widget树中的所有state会依次调用deactivate()[待确认:deactivate调用是否合理?],didUpdateWidget(newWidget)、build()

2. 当ListView中的item滚动出可显示区域的时候，item会被从树中remove掉，此item子树中所有的state都会被dispose，state记录的数据都会销毁，item滚动回可显示区域时，会重新创建全新的state、element、renderobject。

3. 使用hot reload功能时, state实例是没有重新创建的, 如果该state中存在一下复杂的资源更新需要重新加载才能生效, 那么需要在reassemble()添加处理, 不然使用hot reload时候可能会出现一些意想不到的结果, 例如: 要将显示本地文件的内容到屏幕上, 当你开发过程中, 替换了文件中的内容, 但是hot reload没有触发重新读取文件内容, 页面显示还是原来的旧内容.