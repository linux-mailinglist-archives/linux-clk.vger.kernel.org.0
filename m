Return-Path: <linux-clk+bounces-15106-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ED79DB49B
	for <lists+linux-clk@lfdr.de>; Thu, 28 Nov 2024 10:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3184A16694D
	for <lists+linux-clk@lfdr.de>; Thu, 28 Nov 2024 09:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770531547E4;
	Thu, 28 Nov 2024 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AQ9HlM2V"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77830154C0F
	for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 09:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732785084; cv=none; b=a5PJmmz+XRd24V8WIgF7Whqw2tlvwi2q6OhKjAnimzkLPcLR0gwb5xK3FL9AMjdXA3IMzqzfEG87gGh5Y7xEJM3vcJbLAhluIQnKqif3Bj43i8ML3z9daXRihNjA0oLf0/ZGB/DfJMPVB6rR88H7PLALVEJgXy1CK2Ht/4wneMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732785084; c=relaxed/simple;
	bh=wpnonnRKlXhXuDVmIP+yQjBhnVXNBpjv6+yNT/NbmLs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qq1CiZg/4DaBTiVgzgG0aFpt1/+qH4tBVtQfyfjNJYlL1vU7bf03MsUgSlkWzElm68Y0tV3vFj/E4g+QwgiBni1pOA5oem7Djzg9w1M0TpQBmvOcBlsw1mPAPViktAL/yZj11+znRHRRAdRpGBkpsg5Q3C7gx3PU14eFHn2G09M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AQ9HlM2V; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=kOk9ppBSeP0kdD2eMJYpBHVCoqVUdpCPQ5Icozo26Zc=; b=AQ9HlM
	2VaA7Ahi741j8hq73fPwJCQ8j7DWab3kbwWYW6HCj5noEufjP+WXu37QeLiAW98f
	HJcCpRT7Ebwgbtt5o4vGDtK7jO1/Y1P1dscdlilVLQJhePRrvHpfZMW9qQJr00eI
	A3znj3EyazHhTU6m1VsOrxiHBG/GpExL+3xCpyzlrsKLRrVmFez08aeEq7xnpmoB
	Kd58tDah3rMgb8S6yILqyvm6Ck7lHLS2qMuCVitxVMZv0V5C+Oloa1IgrWZPbzo7
	0CGlZva/Z/IrtVdQU8mmKCE+GyBWF0vUcFzMAD5QYdhfJCGq/l9xYexWKxe2m/HS
	Z1tNDFzFLI9HiHnA==
Received: (qmail 853624 invoked from network); 28 Nov 2024 10:11:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Nov 2024 10:11:20 +0100
X-UD-Smtp-Session: l3s3148p1@wjQtd/UnFO5ehhYU
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 2/2] clk: renesas: r9a06g032: use BIT macro consistently
Date: Thu, 28 Nov 2024 10:11:12 +0100
Message-Id: <20241128091113.24116-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241128091113.24116-1-wsa+renesas@sang-engineering.com>
References: <20241128091113.24116-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index ff0b446f4d13..dcda19318b2a 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -27,7 +27,7 @@
 #include <dt-bindings/clock/r9a06g032-sysctrl.h>
 
 #define R9A06G032_SYSCTRL_USB    0x00
-#define R9A06G032_SYSCTRL_USB_H2MODE  (1<<1)
+#define R9A06G032_SYSCTRL_USB_H2MODE BIT(1)
 #define R9A06G032_SYSCTRL_DMAMUX 0xA0
 
 #define R9A06G032_SYSCTRL_RSTEN 0x120
-- 
2.39.2


