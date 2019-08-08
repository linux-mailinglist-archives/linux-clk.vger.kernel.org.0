Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 795B986580
	for <lists+linux-clk@lfdr.de>; Thu,  8 Aug 2019 17:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732577AbfHHPSZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 8 Aug 2019 11:18:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:47196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731038AbfHHPSZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Aug 2019 11:18:25 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97D9E218B6;
        Thu,  8 Aug 2019 15:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565277504;
        bh=GBreKkzgwLBpfgFjLLgpU1KqC2MjQOWS3c7usXsHeh8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=izYzRRnCgZ34ZB9Xp6roK3Vuykt0YcaFUjxA15Wlcnx8p0+ClBJoAh5gcErapUjkf
         nF9sO52BI2j4PEVO0FUVwE0/6IQHnRl/6XgempRnSqFtquMcfSRvyjieRoxnutKeLT
         y4d+GO3xn7dbQnvB8WHjJzhSS2e0t+eZMWRNAaac=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190726070135.14347-2-yong.liang@mediatek.com>
References: <20190726070135.14347-1-yong.liang@mediatek.com> <20190726070135.14347-2-yong.liang@mediatek.com>
Subject: Re: [PATCH v5,2/2] clk: reset: Modify reset-controller driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        "yong.liang" <yong.liang@mediatek.com>
To:     Yong Liang <yong.liang@mediatek.com>, chunhui.dai@mediatek.com,
        drinkcat@chromium.org, eddie.huang@mediatek.com,
        erin.lo@mediatek.com, jamesjj.liao@mediatek.com,
        jasu@njomotys.info, mark.rutland@arm.com, matthias.bgg@gmail.com,
        mturquette@baylibre.com, owen.chen@mediatek.com,
        robh+dt@kernel.org, weiyi.lu@mediatek.com
User-Agent: alot/0.8.1
Date:   Thu, 08 Aug 2019 08:18:23 -0700
Message-Id: <20190808151824.97D9E218B6@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yong Liang (2019-07-26 00:01:35)
> From: "yong.liang" <yong.liang@mediatek.com>
>=20
> Set reset signal by a register and
> clear reset signal by another register for 8183.
>=20
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> ---

Applied to clk-next with this squashed in

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-m=
t8183.c
index 3f1428ed619b..94bbadc0d259 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -1198,8 +1198,8 @@ static int clk_mt8183_infra_probe(struct platform_dev=
ice *pdev)
 	r =3D of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r) {
 		dev_err(&pdev->dev,
-			"%s(): could not register clock provider: %d\n"
-			,__func__, r);
+			"%s(): could not register clock provider: %d\n",
+			__func__, r);
 		return r;
 	}
=20
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 17df8f8b57ea..cb939c071b0c 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -90,7 +90,7 @@ static const struct reset_control_ops mtk_reset_ops_set_c=
lr =3D {
 	.reset =3D mtk_reset_set_clr,
 };
=20
-void mtk_register_reset_controller_common(struct device_node *np,
+static void mtk_register_reset_controller_common(struct device_node *np,
 			unsigned int num_regs, int regofs,
 			const struct reset_control_ops *reset_ops)
 {
