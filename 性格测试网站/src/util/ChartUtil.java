package util;

import java.awt.Color;
import java.awt.Font;
import java.text.DecimalFormat;
import java.text.NumberFormat;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.annotations.CategoryTextAnnotation;
import org.jfree.chart.axis.CategoryAnchor;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.DatasetUtilities;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;
import org.jfree.ui.TextAnchor;

public class ChartUtil {
	public static void main(String[] args) {
		//创建主题样式  
		StandardChartTheme mChartTheme = new StandardChartTheme("CN");
		//设置标题字体  
		mChartTheme.setExtraLargeFont(new Font("黑体", Font.BOLD, 20));
		//设置轴向字体  
		mChartTheme.setLargeFont(new Font("新宋体", Font.BOLD, 15));
		//设置图例字体  
		mChartTheme.setRegularFont(new Font("新宋体", Font.BOLD, 15));
		//应用主题样式  
		ChartFactory.setChartTheme(mChartTheme);
//		double[][] data = new double[][] { { 672, 766, 223, 540, 126 }, { 325, 521, 210, 340, 106 },
//				{ 332, 256, 523, 240, 526 } };
//		String[] rowKeys = { "苹果", "梨子", "葡萄" };
//		String[] columnKeys = { "北京", "上海", "广州", "成都", "深圳" };
//		CategoryDataset dataset = getBarData(data, rowKeys, columnKeys);
//		createTimeXYChar("折线图", "x轴", "y轴", dataset, "lineAndShap.png");
		
		//makePieChart();
		makeBarGroupChart();
	}
	/**
	* 生成分组的柱状图
	*/
	public static void makeBarGroupChart() {
		double[][] data = new double[][] { { 672, 766, 223, 540, 126 }, { 325, 521, 210, 340, 106 },
				{ 332, 256, 523, 240, 526 } };
		String[] rowKeys = { "苹果", "梨子", "葡萄" };
		String[] columnKeys = { "北京", "上海", "广州", "成都", "深圳" };
		CategoryDataset dataset = getBarData(data, rowKeys, columnKeys);
		createBarChart(dataset, "x坐标", "y坐标", "柱状图");
	}
	/**
	* 柱状图
	* 
	*@param dataset 数据集
	* @param xName x轴的说明（如种类，时间等）
	* @param yName y轴的说明（如速度，时间等）
	* @param chartTitle 图标题
	* @param charName 生成图片的名字
	* @return
	*/
	public static JFreeChart createBarChart(CategoryDataset dataset, String xName, String yName, String chartTitle) {
		JFreeChart chart = ChartFactory.createBarChart(chartTitle, // 图表标题
				xName, // 目录轴的显示标签
				yName, // 数值轴的显示标签
				dataset, // 数据集
				PlotOrientation.VERTICAL, // 图表方向：水平、垂直
				true, // 是否显示图例(对于简单的柱状图必须是false)
				false, // 是否生成工具
				false // 是否生成URL链接
				);
		Font labelFont = new Font("SansSerif", Font.TRUETYPE_FONT, 12);
		/*
		* VALUE_TEXT_ANTIALIAS_OFF表示将文字的抗锯齿关闭,
		* 使用的关闭抗锯齿后，字体尽量选择12到14号的宋体字,这样文字最清晰好看
		*/
		// chart.getRenderingHints().put(RenderingHints.KEY_TEXT_ANTIALIASING,RenderingHints.VALUE_TEXT_ANTIALIAS_OFF);
		chart.setTextAntiAlias(false);
		chart.setBackgroundPaint(Color.white);
		// create plot
		CategoryPlot plot = chart.getCategoryPlot();
		// 设置横虚线可见
		plot.setRangeGridlinesVisible(true);
		// 虚线色彩
		plot.setRangeGridlinePaint(Color.gray);
		// 数据轴精度
		NumberAxis vn = (NumberAxis) plot.getRangeAxis();
		// vn.setAutoRangeIncludesZero(true);
		DecimalFormat df = new DecimalFormat("#0.00");
		vn.setNumberFormatOverride(df); // 数据轴数据标签的显示格式
		// x轴设置
		CategoryAxis domainAxis = plot.getDomainAxis();
		domainAxis.setLabelFont(labelFont);// 轴标题
		domainAxis.setTickLabelFont(labelFont);// 轴数值
		// Lable（Math.PI/3.0）度倾斜
		// domainAxis.setCategoryLabelPositions(CategoryLabelPositions
		// .createUpRotationLabelPositions(Math.PI / 3.0));
		domainAxis.setMaximumCategoryLabelWidthRatio(0.6f);// 横轴上的 Lable 是否完整显示
		// 设置距离图片左端距离
		domainAxis.setLowerMargin(0.1);
		// 设置距离图片右端距离
		domainAxis.setUpperMargin(0.1);
		// 设置 columnKey 是否间隔显示
		// domainAxis.setSkipCategoryLabelsToFit(true);
		plot.setDomainAxis(domainAxis);
		// 设置柱图背景色（注意，系统取色的时候要使用16位的模式来查看颜色编码，这样比较准确）
		plot.setBackgroundPaint(new Color(255, 255, 204));
		// y轴设置
		ValueAxis rangeAxis = plot.getRangeAxis();
		rangeAxis.setLabelFont(labelFont);
		rangeAxis.setTickLabelFont(labelFont);
		// 设置最高的一个 Item 与图片顶端的距离
		rangeAxis.setUpperMargin(0.15);
		// 设置最低的一个 Item 与图片底端的距离
		rangeAxis.setLowerMargin(0.15);
		plot.setRangeAxis(rangeAxis);
		BarRenderer renderer = new BarRenderer();
		// 设置柱子宽度
		renderer.setMaximumBarWidth(0.03);
		// 设置柱子高度
		renderer.setMinimumBarLength(0.2);
		// 设置柱子边框颜色
		renderer.setBaseOutlinePaint(Color.BLACK);
		// 设置柱子边框可见
		renderer.setDrawBarOutline(true);
		// // 设置柱的颜色
		renderer.setSeriesPaint(0, new Color(204, 255, 255));
		renderer.setSeriesPaint(1, new Color(153, 204, 255));
		renderer.setSeriesPaint(2, new Color(51, 204, 204));
		renderer.setSeriesPaint(3, new Color(151, 104, 204));
		renderer.setSeriesPaint(4, new Color(251, 104, 204));
		renderer.setSeriesPaint(5, new Color(51, 104, 104));
		renderer.setSeriesPaint(6, new Color(151, 104, 104));
		// 设置每个地区所包含的平行柱的之间距离
		renderer.setItemMargin(0.0);
		// 显示每个柱的数值，并修改该数值的字体属性
		renderer.setIncludeBaseInRange(true);
		renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
		renderer.setBaseItemLabelsVisible(true);
		plot.setRenderer(renderer);
		// 设置柱的透明度
		plot.setForegroundAlpha(1.0f);
		
		
		
		 
		
//		ChartFrame frame = new ChartFrame(chartTitle, chart);
//		frame.pack();
//		frame.setVisible(true);
		
		return chart;
	}

	/**
	* 生成饼状图
	*/
	public static void makePieChart() {
		double[] data = { 9, 81,10 };
		String[] keys = { "失败率", "成功率" ,"其他"};
		createValidityComparePimChar(getDataPieSetByUtil(data, keys), "饼状图", "pie2.png", keys);
	}

	// 饼状图 数据集
	public static PieDataset getDataPieSetByUtil(double[] data, String[] datadescription) {
		if (data != null && datadescription != null) {
			if (data.length == datadescription.length) {
				DefaultPieDataset dataset = new DefaultPieDataset();
				for (int i = 0; i < data.length; i++) {
					dataset.setValue(datadescription[i], data[i]);
				}
				return dataset;
			}
		}
		return null;
	}

	/**
	* 饼状图
	* 
	* @param dataset 数据集
	* @param chartTitle 图标题
	* @param charName 生成图的名字
	* @param pieKeys 分饼的名字集
	* @return
	*/
	public static JFreeChart createValidityComparePimChar(PieDataset dataset, String chartTitle, String charName, String[] pieKeys) {
		JFreeChart chart = ChartFactory.createPieChart3D(chartTitle, // chart
				// title
				dataset,// data
				true,// include legend
				true, false);
		// 使下说明标签字体清晰,去锯齿类似于
		// chart.getRenderingHints().put(RenderingHints.KEY_TEXT_ANTIALIASING,RenderingHints.VALUE_TEXT_ANTIALIAS_OFF);的效果
		chart.setTextAntiAlias(false);
		// 图片背景色
		chart.setBackgroundPaint(Color.white);
		// 设置图标题的字体重新设置title

		chart.setTitle(chartTitle);
		PiePlot3D plot = (PiePlot3D) chart.getPlot();
		// 图片中显示百分比:默认方式
		// 指定饼图轮廓线的颜色
		// plot.setBaseSectionOutlinePaint(Color.BLACK);
		// plot.setBaseSectionPaint(Color.BLACK);
		// 设置无数据时的信息
		plot.setNoDataMessage("无对应的数据，请重新查询。");
		// 设置无数据时的信息显示颜色
		plot.setNoDataMessagePaint(Color.red);
		// 图片中显示百分比:自定义方式，{0} 表示选项， {1} 表示数值， {2} 表示所占比例 ,小数点后两位
		plot.setLabelGenerator(new StandardPieSectionLabelGenerator("{0}: {1}({2})", NumberFormat.getNumberInstance(),
				new DecimalFormat("0.00%")));
		// 图例显示百分比:自定义方式， {0} 表示选项， {1} 表示数值， {2} 表示所占比例
		plot.setLegendLabelGenerator(new StandardPieSectionLabelGenerator("{0}: {1}({2})"));
		plot.setLabelFont(new Font("SansSerif", Font.TRUETYPE_FONT, 12));
		// 指定图片的透明度(0.0-1.0)
		plot.setForegroundAlpha(0.65f);
		// 指定显示的饼图上圆形(false)还椭圆形(true)
		plot.setCircular(false, true);
		// 设置第一个 饼块section 的开始位置，默认是12点钟方向
		plot.setStartAngle(90);
		// // 设置分饼颜色
		plot.setSectionPaint(pieKeys[0], new Color(244, 194, 144));
		plot.setSectionPaint(pieKeys[1], new Color(144, 233, 144));
//		ChartFrame frame = new ChartFrame(chartTitle, chart);
//		frame.pack();
//		frame.setVisible(true);
		
		return chart;
	}

	public static CategoryDataset getBarData(double[][] data, String[] rowKeys, String[] columnKeys) {
		return DatasetUtilities.createCategoryDataset(rowKeys, columnKeys, data);
	}

	public static void createTimeXYChar(String chartTitle, String x, String y, CategoryDataset xyDataset,
			String charName) {

		JFreeChart chart = ChartFactory.createLineChart(chartTitle, x, y, xyDataset, PlotOrientation.VERTICAL, true,
				true, false);
		chart.setTextAntiAlias(false);
		chart.setBackgroundPaint(Color.WHITE);
		// 设置图标题的字体重新设置title
		chart.setTitle(chartTitle);
		// 设置面板字体
		chart.setBackgroundPaint(Color.WHITE);
		CategoryPlot categoryplot = (CategoryPlot) chart.getPlot();
		// x轴 // 分类轴网格是否可见
		categoryplot.setDomainGridlinesVisible(true);
		// y轴 //数据轴网格是否可见
		categoryplot.setRangeGridlinesVisible(true);
		categoryplot.setRangeGridlinePaint(Color.WHITE);// 虚线色彩
		categoryplot.setDomainGridlinePaint(Color.WHITE);// 虚线色彩
		categoryplot.setBackgroundPaint(Color.lightGray);
		// 设置轴和面板之间的距离
		// categoryplot.setAxisOffset(new RectangleInsets(5D, 5D, 5D, 5D));
		CategoryAxis domainAxis = categoryplot.getDomainAxis();
		domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45); // 横轴上的
		// Lable
		// 45度倾斜
		// 设置距离图片左端距离
		domainAxis.setLowerMargin(0.0);
		// 设置距离图片右端距离
		domainAxis.setUpperMargin(0.0);
		NumberAxis numberaxis = (NumberAxis) categoryplot.getRangeAxis();
		numberaxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
		numberaxis.setAutoRangeIncludesZero(true);
		// 获得renderer 注意这里是下嗍造型到lineandshaperenderer！！
		LineAndShapeRenderer lineandshaperenderer = (LineAndShapeRenderer) categoryplot.getRenderer();
		lineandshaperenderer.setBaseShapesVisible(true); // series 点（即数据点）可见
		lineandshaperenderer.setBaseLinesVisible(true); // series 点（即数据点）间有连线可见
		// 显示折点数据
		// lineandshaperenderer.setBaseItemLabelGenerator(new
		// StandardCategoryItemLabelGenerator());
		// lineandshaperenderer.setBaseItemLabelsVisible(true);
		ChartFrame frame = new ChartFrame(chartTitle, chart);
		frame.pack();
		frame.setVisible(true);

	}
}
