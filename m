Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 508935B6B84
	for <lists+linux-clk@lfdr.de>; Tue, 13 Sep 2022 12:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbiIMKWB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 13 Sep 2022 06:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbiIMKWB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Sep 2022 06:22:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A149856BB5
        for <linux-clk@vger.kernel.org>; Tue, 13 Sep 2022 03:21:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oY332-0002tb-SQ; Tue, 13 Sep 2022 12:21:44 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mfe@pengutronix.de>)
        id 1oY333-000TmE-EV; Tue, 13 Sep 2022 12:21:44 +0200
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mfe@pengutronix.de>)
        id 1oY331-004pJx-DS; Tue, 13 Sep 2022 12:21:43 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        abelvesa@kernel.org, abel.vesa@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com
Cc:     linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [RFC PATCH 0/2] Propose critical clocks
Date:   Tue, 13 Sep 2022 12:21:39 +0200
Message-Id: <20220913102141.971148-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

this proposal is to mark clocks as critical. It is somehow inspired by
the regulator-always-on property. Since sometimes we can end in circular
dependcies if we wanna solve the dependcies for a specific clock
provider.

The property is generic so it can be used by every hw clock provider. So
it can be seen as generic implementation to [1].

[1] https://lore.kernel.org/linux-clk/20220913092136.1706263-1-peng.fan@oss.nxp.com/

Marco Felsch (2):
  clk: add support for critical always-on clocks
  arm64: dts: imx8mm-evk: mark 32k pmic clock as always-on

 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi |  1 +
 drivers/clk/clk.c                             | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

-- 
2.30.2

