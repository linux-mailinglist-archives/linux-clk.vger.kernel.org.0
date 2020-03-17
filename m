Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 439891888CD
	for <lists+linux-clk@lfdr.de>; Tue, 17 Mar 2020 16:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgCQPNv (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Mar 2020 11:13:51 -0400
Received: from out28-220.mail.aliyun.com ([115.124.28.220]:60628 "EHLO
        out28-220.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbgCQPNv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Mar 2020 11:13:51 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2034004|-1;CH=green;DM=||false|;DS=CONTINUE|ham_system_inform|0.0742784-0.00260228-0.923119;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03296;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.H0zKH5l_1584457917;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.H0zKH5l_1584457917)
          by smtp.aliyun-inc.com(10.147.42.241);
          Tue, 17 Mar 2020 23:13:13 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, paul@crapouillou.net,
        dongsheng.qiu@ingenic.com, yanfei.li@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH RESEND] Add support for TCU of X1000.
Date:   Tue, 17 Mar 2020 23:11:32 +0800
Message-Id: <1584457893-40418-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584457893-40418-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1584457893-40418-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support for TCU of X1000 from Ingenic. X1000 has a different TCU,
since X1000 OST has been independent of TCU. This patch is add TCU
support of X1000, and prepare for later OST driver.

周琰杰 (Zhou Yanjie) (1):
  clk: Ingenic: Add support for TCU of X1000.

 drivers/clk/ingenic/tcu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.7.4

