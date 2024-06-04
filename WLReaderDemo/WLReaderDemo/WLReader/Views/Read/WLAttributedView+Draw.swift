//
//  WLAttributedView+Draw.swift
//  DuKu
//
//  Created by 李伟 on 2024/6/2.
//

import UIKit

extension WLAttributedView {
    //    MARK: draw
    
    override func draw(_ layer: CALayer, in ctx: CGContext) {
        super.draw(layer, in: ctx)
        self.drawSelectedLines(context: ctx)
        drawLeftRightCursor(context: ctx)
        drawDash(context: ctx)
    }
    
    private func drawSelectedLines(context: CGContext?) -> Void {
        if selectedLineArray.isEmpty {
            return
        }
        let path = CGMutablePath()
        for item in selectedLineArray {
            path.addRect(item)
        }
        let color = WL_READER_SELECTED_COLOR
        
        context?.setFillColor(color.cgColor)
        context?.addPath(path)
        context?.fillPath()
    }
    // MARK - 绘制左右游标
    private func drawLeftRightCursor(context:CGContext?) {
        if selectedLineArray.isEmpty {
            return
        }
        let firstRect = selectedLineArray.first!
        leftCursor = CGRect(x: firstRect.origin.x - 4, y: firstRect.origin.y, width: 4, height: firstRect.size.height)
        let lastRect = selectedLineArray.last!
        rightCursor = CGRect(x: lastRect.maxX, y: lastRect.origin.y, width: 4, height: lastRect.size.height)
        
        context?.addRect(leftCursor)
        context?.addRect(rightCursor)
        context?.addEllipse(in: CGRect(x: leftCursor.midX - 3, y: leftCursor.origin.y - 6, width: 6, height: 6))
        context?.addEllipse(in: CGRect(x: rightCursor.midX - 3, y: rightCursor.maxY, width: 6, height: 6))
        context?.setFillColor(WL_READER_CURSOR_COLOR.cgColor)
        context?.fillPath()
    }
    // MARK - 绘制虚线
    private func drawDash(context:CGContext?) {
        if noteArr.isEmpty {
            return
        }
        for item in noteArr {
            // 设置虚线样式
            let pattern: [CGFloat] = [5, 5]
            context?.setLineDash(phase: 0, lengths: pattern)
            context?.move(to: CGPointMake(item.origin.x, item.origin.y + item.height))
            context?.addLine(to: CGPointMake(item.origin.x + item.width, item.origin.y + item.height))
                // 设置线条宽度和颜色
            context?.setLineWidth(2.0)
            context?.setStrokeColor(WL_READER_CURSOR_COLOR.cgColor)
            context?.strokePath()
        }
    }
}
