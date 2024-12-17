Return-Path: <linux-clk+bounces-15903-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA9E9F42FB
	for <lists+linux-clk@lfdr.de>; Tue, 17 Dec 2024 06:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C5D07A6EBC
	for <lists+linux-clk@lfdr.de>; Tue, 17 Dec 2024 05:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561901D95B4;
	Tue, 17 Dec 2024 05:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T4ZFC3Ps"
X-Original-To: linux-clk@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49DB1D54E3;
	Tue, 17 Dec 2024 05:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734413560; cv=none; b=HB89/ZW9JzjhC9fTNjFG1hshYKhr7FY1zVdwW5FNBlgxbeb1rUgtkSVJGDaFjyVFEk8FE/PBlhQFJPbAbLZQ9wfoom252fAQMaLp7ojShUhW/M/LDT0BzLmp818I0lNnR8OLXzXwSklsbUldBSryMXFAsYOqdlJgeUXosWk5qK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734413560; c=relaxed/simple;
	bh=47sDiubgqaQkaDbcosAByaG1Ni6cOzGOKnQlTVO76og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hIqHTmFX0a+nNvhXbae9WX7/9yKXpj2cAwGoRlbXMaLzJleoPhudcKLIpuAtc3jWvzy9D+Im7zZbXvJo99gTChfa4tvjWzBcw2B1EU5YT594pIYSJDslfq9v5A4MFYtZIgrGy2NX+GLW1TQdUGt52AQI3P1ic49fxc2SR4h/AlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T4ZFC3Ps; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 562CC55;
	Tue, 17 Dec 2024 06:31:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734413516;
	bh=47sDiubgqaQkaDbcosAByaG1Ni6cOzGOKnQlTVO76og=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T4ZFC3PsTYJd0oxdmEB2iEdEgxcrrosy2D4E7TVzm48hbM8SbG0f23LqlBQIfe4D4
	 P8jWyUJ18M1Rs+EUaRyMTR7U6/sMspMDTp0KyjQut2j89VTWiK3UhRcdRSwxu1SsG4
	 VcDfS5eqhFGyOG9PZ1m1h8EpUxE/MWA0KPOTBLPc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 17 Dec 2024 07:31:40 +0200
Subject: [PATCH v5 6/7] drm/rcar-du: dsi: Add r8a779h0 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-rcar-gh-dsi-v5-6-e77421093c05@ideasonboard.com>
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
In-Reply-To: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dOcoxtMfzjVQWbNdCVgHPfsgULtxlauUf/dbpEGcHa8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnYQzk76RXTNsgekr9Z29j8YIdp9ab9gkeRLB6c
 XMH1nfMASSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ2EM5AAKCRD6PaqMvJYe
 9WuOD/93Mj5teiUnCSzU7gfu+YPsrcWv7fDZsbCaMm0utaX1X53evehI1enUxHjIZc056Lbq+Xf
 K5AnvhMieZbOsV8kTaRg3XDS43wbYoG65fCOC2KoR1Culprny+ett3k/6/zPga21boDqAnEzCFa
 JVZbiEfdUKy63ViLtQMhRYlQg94u/GCkxxA/HswHrOja5n7QG5wV04+PJizsXVJHcBvMo750//4
 Nuo1ycxlWtrx0vepS1xypdX5P37iQKwpjiXEpsVavt7EWCGx0WAA6KeHOGmPJ4Ms5uoj5L87/me
 XRL446Z1f2wUpV6BEtzGSiVaEYoLgyGWMYHP1fepSmyqLlIGSaNJT/AMz9pc6bFTG/w255BV63B
 O1Ha7FuVOylVFTPgvDhjAFH62JE7Ki/Xw5ef4JO0dqcwHIT59Gzlnb0VvpRndyFnW5xQfC5DB/Z
 vXO+eBZst5lLd08OVg8wTobBKYWZibnw0fJ8hY4obf8RPZroEucu8sfpEDMjFK4CszuoCGM564s
 DQq8fgl8CdX7K2kr82MY1P3Ht5hrWiONfirPQimPskum5CguKOzh+m/UULjI5+obOfGoMQhlK5i
 HzdlAyLzbZf7s7PPk1bRNImhPQvKBw5rOWG99Iui646v/yyYg/NaScUjvNyxlaTu30jsdUOKRFL
 iJ1gj/uF87ISRUg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add support for DSI on r8a779h0. As it is identical to DSI on r8a779g0,
all we need is to handle the compatible string.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 92f4261305bd..36e902601f84 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -1081,6 +1081,8 @@ static const struct rcar_mipi_dsi_device_info v4h_data = {
 static const struct of_device_id rcar_mipi_dsi_of_table[] = {
 	{ .compatible = "renesas,r8a779a0-dsi-csi2-tx", .data = &v3u_data },
 	{ .compatible = "renesas,r8a779g0-dsi-csi2-tx", .data = &v4h_data },
+	/* DSI in r8a779h0 is identical to r8a779g0 */
+	{ .compatible = "renesas,r8a779h0-dsi-csi2-tx", .data = &v4h_data },
 	{ }
 };
 

-- 
2.43.0


