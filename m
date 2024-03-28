Return-Path: <linux-clk+bounces-5062-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C26FD88CAE9
	for <lists+linux-clk@lfdr.de>; Tue, 26 Mar 2024 18:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42638B27854
	for <lists+linux-clk@lfdr.de>; Tue, 26 Mar 2024 17:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A891CD32;
	Tue, 26 Mar 2024 17:31:28 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D9E1C6A0
	for <linux-clk@vger.kernel.org>; Tue, 26 Mar 2024 17:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711474288; cv=none; b=GVbHwWLCaZQZi9OkMliGj6j1ZNUQ7/n0pzgLkGjlNMDFWZHMZM60flXIq2NV3G0+8V3YMQNNyvvGa7lpnDY1bfL+j0bB5WPVQZNWoyayzihZMW5AwlpzAziBy34WWDeIvtKwaa7PbHA7zfXaUBsqlTanOtdetOyinogJj2vlc1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711474288; c=relaxed/simple;
	bh=bq4YNkziyQcZmvz2N637u5vOHPJJEnrP824rDyNrXGE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mFv2DsOa0DCpuyZlgPvziZtKyk5VHY0u3UDeJl6TjVcp41uKy6yLWTpsUj5hir4Fvr4DxPhmBFpOx2ReHIJMw0TE5GsWT0LjJSV9U1HlomtEnMUDiQ1L2/tObzIONJ07gli3Iip3z/JiJdThzMqZQGrrfkDaOnEhUZKEFpWSWow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by baptiste.telenet-ops.be with bizsmtp
	id 3VXD2C00R0SSLxL01VXDi8; Tue, 26 Mar 2024 18:31:18 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rpAdO-0053lJ-Rf;
	Tue, 26 Mar 2024 18:31:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rpAdl-001ZMO-Kd;
	Tue, 26 Mar 2024 18:31:13 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm: DRM_WERROR should depend on DRM
Date: Tue, 26 Mar 2024 18:31:11 +0100
Message-Id: <631a1f4c066181b54617bfe2f38b0bd0ac865b68.1711474200.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no point in asking the user about enforcing the DRM compiler
warning policy when configuring a kernel without DRM support.

Fixes: f89632a9e5fa6c47 ("drm: Add CONFIG_DRM_WERROR")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f2bcf5504aa77679..2e1b23ccf30423a9 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -423,7 +423,7 @@ config DRM_PRIVACY_SCREEN
 
 config DRM_WERROR
 	bool "Compile the drm subsystem with warnings as errors"
-	depends on EXPERT
+	depends on DRM && EXPERT
 	default n
 	help
 	  A kernel build should not cause any compiler warnings, and this
-- 
2.34.1


