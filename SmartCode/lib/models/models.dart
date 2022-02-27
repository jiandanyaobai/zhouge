/**
 * @Author: zhouge
 * @Description:
 * @Date: Created in 15:27 2020-10-18
 * @Modified By:
 **/
import 'package:flutter/material.dart';

// 构造函数
class BasicItem {
  final String title;
  final String avater;
  final bool isShowicon;
  final List<Widget> widget;
  final VoidCallback onPressed;
  final String path;

  BasicItem({
    this.isShowicon,
    this.widget,
    this.title,
    this.avater,
    this.onPressed,
    this.path,
  });
}

// 采购界面数据
class PurchaseData {
  final List<BasicItem> demos = [
    BasicItem(
        title: '采购收货',
        avater: 'assets/images/icon_nocome_alllot.png',
        isShowicon: true,
        onPressed: () {print('采购收货');},
        path:'/purchase-receive'
    ),

    BasicItem(
        title: '扫码收货',
        avater: 'assets/images/icon_scan_inapection.png',
        isShowicon: true,
        onPressed: () {print('扫码收货');},
        path:'/scan-receive'),
    BasicItem(
        title: '扫码入库',
        avater: 'assets/images/icon_purchase_in_store.png',
        isShowicon: true,
        onPressed: () {print('扫码入库');},
        path: '/scan-inbound'),
    BasicItem(
        title: '采购仓退',
        avater: 'assets/images/icon_warehouse_return.png',
        isShowicon: true,
        onPressed: () {
          print('采购仓退');
        }),
    BasicItem(
        title: '来料检验',
        avater: 'assets/images/icon_exceed_patch_send.png',
        isShowicon: true,
        onPressed: () {
          print('来料检验');
        }),
    BasicItem(
        title: '平板检验',
        avater: 'assets/images/icon_iqc_check_pad.png',
        isShowicon: true,
        onPressed: () {
          print('平板检验');
        }),
    BasicItem(
        title: '快速收货',
        avater: 'assets/images/icon_fast_receipt_goods.png',
        isShowicon: true,
        onPressed: () {print('快速收货');},
        path: '/quick-receive'),
    BasicItem(
        title: '快速收货(供)',
        avater: 'assets/images/icon_srm_fast_receipt_goods.png',
        isShowicon: true,
        path: '/quick-receive',
        onPressed: () {print('快速收货');}),
    BasicItem(
        title: '采购入库',
        avater: 'assets/images/icon_purchase_in_ware.png',
        isShowicon: true,
        onPressed: () {
          print('采购入库');
        }),
    BasicItem(
        title: '送货入库(供)',
        avater: 'assets/images/icon_srm_scan_in_store.png',
        isShowicon: true,
        onPressed: () {
          print('送货入库');
        }),
  ];

  static PurchaseData mock() {
    return PurchaseData();
  }
}

//生产界面数据
class WorkData {
  final List<BasicItem> demos = [
    BasicItem(
        title: '工单发料',
        avater: 'assets/images/icon_work_order.png',
        isShowicon: true,
        onPressed: () {
          print('工单发料');
        }),
    BasicItem(
        title: '成品发料',
        avater: 'assets/images/icon_accordingmaterial.png',
        isShowicon: true,
        onPressed: () {
          print('成品发料');
        }),
    BasicItem(
        title: '生产超领',
        avater: 'assets/images/icon_production_receive.png',
        isShowicon: true,
        onPressed: () {
          print('生产超领');
        }),
    BasicItem(
        title: '领料下架',
        avater: 'assets/images/icon_suitpicking.png',
        isShowicon: true,
        onPressed: () {
          print('领料下架');
        }),
    BasicItem(
        title: '工单入库',
        avater: 'assets/images/icon_order_putaway.png',
        isShowicon: true,
        onPressed: () {
          print('工单入库');
        }),
    BasicItem(
        title: '退料补料',
        avater: 'assets/images/icon_ordermaterial.png',
        isShowicon: true,
        onPressed: () {
          print('退料补料');
        }),
    BasicItem(
        title: '退料上架',
        avater: 'assets/images/icon_return_of_material.png',
        isShowicon: true,
        onPressed: () {
          print('退料上架');
        }),
    BasicItem(
        title: '工单退料',
        avater: 'assets/images/icon_work_order_return.png',
        isShowicon: true,
        onPressed: () {
          print('工单退料');
        }),
    BasicItem(
        title: '入库申请',
        avater: 'assets/images/icon_complete_storage.png',
        isShowicon: true,
        onPressed: () {
          print('入库申请');
        }),
    BasicItem(
        title: '入库上架',
        avater: 'assets/images/icon_putaway.png',
        isShowicon: true,
        onPressed: () {
          print('入库上架');
        }),
    BasicItem(
        title: '成品入库',
        avater: 'assets/images/icon_finishedstorage.png',
        isShowicon: true,
        onPressed: () {
          print('成品入库');
        }),
    BasicItem(
        title: '成品调拨',
        avater: 'assets/images/icon_endproduct_allot.png',
        isShowicon: true,
        onPressed: () {
          print('成品调拨');
        }),
    BasicItem(
        title: '完工检验',
        avater: 'assets/images/icon_fqc_check_pad.png',
        isShowicon: true,
        onPressed: () {
          print('完工检验');
        }),
    BasicItem(
        title: '工序报工',
        avater: 'assets/images/icon_pallet_report.png',
        isShowicon: true,
        onPressed: () {
          print('工序报工');
        }),
    BasicItem(
        title: '成品绑定',
        avater: 'assets/images/icon_stock_scrap.png',
        isShowicon: true,
        onPressed: () {
          print('成品绑定');
        }),
    BasicItem(
        title: '收料确认',
        avater: 'assets/images/icon_stock_scrap.png',
        isShowicon: true,
        onPressed: () {
          print('收料确认');
        }),
    BasicItem(
        title: '仓库备料',
        avater: 'assets/images/icon_putaway.png',
        isShowicon: true,
        onPressed: () {
          print('仓库备料');
        }),
    BasicItem(
        title: '入库确认',
        avater: 'assets/images/icon_process_entry.png',
        isShowicon: true,
        onPressed: () {
          print('入库确认');
        }),
  ];
  static WorkData mock() {
    return WorkData();
  }
}

// 仓库数据
class WareHouseData {
  final List<BasicItem> demos = [
    BasicItem(
        title: '无源调拨',
        avater: 'assets/images/icon_nocome_alllot.png',
        isShowicon: true,
        onPressed: () {
          print('无源调拨');
        }),
    BasicItem(
        title: '其他出库',
        avater: 'assets/images/icon_miscellaneous_issues_out.png',
        isShowicon: true,
        onPressed: () {
          print('其他出库');
        }),
    BasicItem(
        title: '其他入库',
        avater: 'assets/images/icon_miscellaneous_issues_in.png',
        isShowicon: true,
        onPressed: () {
          print('其他入库');
        }),
    BasicItem(
        title: '无源入库',
        avater: 'assets/images/icon_miscellaneous_nocome_in.png',
        isShowicon: true,
        onPressed: () {
          print('无源入库');
        }),
    BasicItem(
        title: '库存查询',
        avater: 'assets/images/icon_store_query.png',
        isShowicon: true,
        onPressed: () {
          print('库存查询');
        }),
    BasicItem(
        title: '仓内移储',
        avater: 'assets/images/icon_movestore.png',
        isShowicon: true,
        onPressed: () {
          print('仓内移储');
        }),
    BasicItem(
        title: '库存盘点',
        avater: 'assets/images/icon_stock_check.png',
        isShowicon: true,
        onPressed: () {
          print('库存盘点');
        }),
    BasicItem(
        title: '库存调拨',
        avater: 'assets/images/icon_post_allot.png',
        isShowicon: true,
        onPressed: () {
          print('库存调拨');
        }),
    BasicItem(
        title: '标签补打',
        avater: 'assets/images/icon_finished_product_print.png',
        isShowicon: true,
        onPressed: () {
          print('标签补打');
        }),
    BasicItem(
        title: '产品装箱',
        avater: 'assets/images/icon_encasement.png',
        isShowicon: true,
        onPressed: () {
          print('产品装箱');
        }),
    BasicItem(
        title: '产品出箱',
        avater: 'assets/images/icon_outbox.png',
        isShowicon: true,
        onPressed: () {
          print('产品出箱');
        }),
    BasicItem(
        title: '调拨出库',
        avater: 'assets/images/icon_allot_out.png',
        isShowicon: true,
        onPressed: () {
          print('调拨出库');
        }),
    BasicItem(
        title: '调拨入库',
        avater: 'assets/images/icon_allot_in.png',
        isShowicon: true,
        onPressed: () {
          print('调拨入库');
        }),
    BasicItem(
        title: '补打报表',
        avater: 'assets/images/icon_print_report.png',
        isShowicon: true,
        onPressed: () {
          print('补打报表');
        }),
    BasicItem(
        title: '标签补打(bt)',
        avater: 'assets/images/icon_print_report.png',
        isShowicon: true,
        onPressed: () {
          print('标签补打(bt)');
        }),
  ];

  static WareHouseData mock() {
    return WareHouseData();
  }
}

// 销售数据
class SaleData {
  final List<BasicItem> demos = [
    BasicItem(
        title: '通知下架',
        avater: 'assets/images/icon_saleoutlet.png',
        isShowicon: true,
        onPressed: () {
          print('通知下架');
        }),
    BasicItem(
        title: '出货下架',
        avater: 'assets/images/icon_pickup_shipment.png',
        isShowicon: true,
        onPressed: () {
          print('出货下架');
        }),
    BasicItem(
        title: '销售退货',
        avater: 'assets/images/icon_ntsale_return.png',
        isShowicon: true,
        onPressed: () {
          print('销售退货');
        }),
    BasicItem(
        title: 'OQC检验(平板)',
        avater: 'assets/images/icon_oqc.png',
        isShowicon: true,
        onPressed: () {
          print('OQC检验(平板)');
        }),
    BasicItem(
        title: '出通检验(平板)',
        avater: 'assets/images/icon_saleoutoqc.png',
        isShowicon: true,
        onPressed: () {
          print('出通检验(平板)');
        }),
    BasicItem(
        title: '配货下架',
        avater: 'assets/images/icon_goodsdown.png',
        isShowicon: true,
        onPressed: () {
          print('配货下架');
        }),
    BasicItem(
        title: '月台移储',
        avater: 'assets/images/icon_bad_move.png',
        isShowicon: true,
        onPressed: () {
          print('月台移储');
        }),
    BasicItem(
        title: '货品装车',
        avater: 'assets/images/icon_entruckgoods.png',
        isShowicon: true,
        onPressed: () {
          print('货品装车');
        }),
    BasicItem(
        title: '多角下架',
        avater: 'assets/images/icon_out_source_in_store.png',
        isShowicon: true,
        onPressed: () {
          print('多角下架');
        }),
  ];

  static SaleData mock() {
    return SaleData();
  }
}
