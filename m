Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5936C11E653
	for <lists+linux-clk@lfdr.de>; Fri, 13 Dec 2019 16:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbfLMPV1 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 13 Dec 2019 10:21:27 -0500
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:44113 "EHLO
        out28-195.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbfLMPV1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Dec 2019 10:21:27 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1875682|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0205657-0.000635969-0.978798;DS=CONTINUE|ham_system_inform|0.104908-0.00039177-0.8947;FP=12608124286243724992|1|1|1|0|-1|-1|-1;HT=e01l07423;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.GGSxanS_1576250475;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GGSxanS_1576250475)
          by smtp.aliyun-inc.com(10.147.40.233);
          Fri, 13 Dec 2019 23:21:21 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: clk: Ingenic: Add support for the X1830 v2.
Date:   Fri, 13 Dec 2019 23:21:06 +0800
Message-Id: <1576250472-124315-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

v1->v2:
1.Use two fields (pll_reg & bypass_reg) instead of the 2-values
  array (reg[2]).
2.Remove the "pll_info->version" and add a "pll_info->rate_multiplier".
3.Fix the coding style and add more detailed commit message.
4.Remove [4/5] and [5/5] in v1, because some problems were found in
  subsequent tests.
5.Remove unnecessary spinlock as Paul Burton and Paul Cercueil's suggestion.
6.Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
  to "周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>" because
  the old mailbox is in an unstable state.

