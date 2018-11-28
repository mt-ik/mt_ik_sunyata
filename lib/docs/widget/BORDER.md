#Flutter 组件边框、圆角

new Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
    decoration: new BoxDecoration(
        /// 只设置上边框
        /// border: new Border(top: new BorderSide( width: 1.0, color: Colors.black87)),
        /// 所有边框
        border: new Border.all(width: 2.0, color: Colors.black87),
        /// border: Border.all(color: Colors.black87, width: 1.0),
        /// borderRadius: BorderRadius.circular(10.0),
        /// 所有圆角
        /// borderRadius: BorderRadius.all(Radius.circular(10.0)),
        /// 只设置左上圆角
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0)),
    ),
)

1. 通过Container的decoration实现边框和圆角
    decoration里用到BoxDecoration组件, 常用属性:
    color颜色
    border 描边宽度
    borderRadius 圆角值
    boxShadow 阴影
    支持gradient 梯度,混合模式backgroundBlendMode shape自定义形状
    Border BorderRadius同样支持多种自定方法.
2. 通过Container的padding实现内边距
    EdgeInsets支持多种自定义方法:
    EdgeInsets.all() 全方向
    EdgeInsets.only(left,top,right,bottom) 自定义各方向的边距
    EdgeInsets.symmetric(vertical, horizontal)自定义垂直,水平对称边距
    EdgeInsets.fromWindowPadding(ui.WindowPadding padding, double devicePixelRatio) 根据机型屏幕尺寸定义


