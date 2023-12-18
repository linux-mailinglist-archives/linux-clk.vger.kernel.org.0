Return-Path: <linux-clk+bounces-1645-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9528170AA
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 14:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44EEAB2214D
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 13:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D852E129EF3;
	Mon, 18 Dec 2023 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="apjSg2Lz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B08D11CA6;
	Mon, 18 Dec 2023 13:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oltmanns.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oltmanns.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Sv17D6pmMz9spY;
	Mon, 18 Dec 2023 14:36:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
	s=MBO0001; t=1702906569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxtk83TwUN0VceZvRnC2EeHgKW+WXgUR7ixken6dUY4=;
	b=apjSg2LzkrIFwQkduz6/06Bhype5LfUj7ino5vfUAXK9zTjohCQRTBH+FFMgVkb39DDsCC
	qe3XzKdyax4u/OOURdNRwvSmr7QTQtUicB0w/u6ENiF/kxzLmecOhIjtNKFuqaIxdXIumn
	w6ee7gCTx+qye5L4jyDucJmkn1hsuz7dN6/Lp9w4+kuBLk+4OAkV1yOCI9vvAMbsnoC/KC
	Qidxvxbw0GJnL5NVb0WtERQU2I2mowKwo76YKynse7kYFy60Ib0wKyZhThwx8XydTfBSCc
	F5ssg00kcTqhkSuXRlNKrsya0T1QLwMfTlFVSB1rf43koUltznzC2dd3PKrbyg==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 18 Dec 2023 14:35:21 +0100
Subject: [PATCH 3/5] clk: sunxi-ng: nm: Support constraints on n/m ratio
 and parent rate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231218-pinephone-pll-fixes-v1-3-e238b6ed6dc1@oltmanns.dev>
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
In-Reply-To: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Frank Oltmanns <frank@oltmanns.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4021; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=mTT0TdC8MF6bUvNEQSrDhtACC0CeYZEAGGdbPaSNC/g=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBlgEq1kJc2STPHa/pkXQ2BvjxkjpLdFUr+xmDFH
 Wj0A1DilGSJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZYBKtQAKCRCaaaIIlErT
 xzvmC/wMINJUDhSp9FdIb8sCaRKy2CrTQhZXpufTzT8FNRdsxN3xV/HE+LVlhRzgOpzC5YpRGx2
 JIbgtvX+ALwZ+MvUfTIBKjwMe7q7FWNsGBYvZDI8gsdIj3WvKn9WEpSaIOuz0zcmzfOtWrgIqFs
 uLSlq4az82QGazG/naM8sapiCc7ptqmj+cVyOihnSRevx3N1E8L07SPHKU1SSsyqmXuTwr/09Gm
 AUbDIqCN86uXQCCeBxWo6i8BkrYY5pkvRggXtAtK1kmQtRVYCjiIGJljenBahHR3+mWo8vUaEnz
 /8VxUVBzz4XGkqxWIJFhQyxJ+fswIgVJhurhTMnLGE3rXVNwnyNa72MVv2NyaC/YaS7B9L8/01R
 SsDC7sanA5tRZQU4IEpC9p0l/fBak4WMfUtucDLI39qgbMtrdgrJ9gUU9GY4407bRxyDF/EfKYz
 vNhO9JkjLZ2QYiYrT1yo2IfEyStnqcn6FZjLa8U2hq8mWBtkutbP10KNJMS02KO6Ou8T4=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
X-Rspamd-Queue-Id: 4Sv17D6pmMz9spY

The Allwinner A64 manual lists the following constraint for the
PLL-VIDEO0 clock: 8 <= N/M <= 25

The PLL-MIPI clock is implemented as ccu_nm. Therefore, add support for
this constraint.

Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
---
 drivers/clk/sunxi-ng/ccu_nm.c | 21 +++++++++++++++++++--
 drivers/clk/sunxi-ng/ccu_nm.h | 34 ++++++++++++++++++++++++++++++++--
 2 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_nm.c
index ffac3deb89d6..cfc6981e398b 100644
--- a/drivers/clk/sunxi-ng/ccu_nm.c
+++ b/drivers/clk/sunxi-ng/ccu_nm.c
@@ -27,6 +27,19 @@ static unsigned long ccu_nm_calc_rate(unsigned long parent,
 	return rate;
 }
 
+static bool ccu_nm_is_valid_rate(struct ccu_common *common, unsigned long n, unsigned long m)
+{
+	struct ccu_nm *nm = container_of(common, struct ccu_nm, common);
+
+	if (nm->max_nm_ratio && (n > nm->max_nm_ratio * m))
+		return false;
+
+	if (nm->min_nm_ratio && (n < nm->min_nm_ratio * m))
+		return false;
+
+	return true;
+}
+
 static unsigned long ccu_nm_find_best(struct ccu_common *common, unsigned long parent,
 				      unsigned long rate, struct _ccu_nm *nm)
 {
@@ -36,8 +49,12 @@ static unsigned long ccu_nm_find_best(struct ccu_common *common, unsigned long p
 
 	for (_n = nm->min_n; _n <= nm->max_n; _n++) {
 		for (_m = nm->min_m; _m <= nm->max_m; _m++) {
-			unsigned long tmp_rate = ccu_nm_calc_rate(parent,
-								  _n, _m);
+			unsigned long tmp_rate;
+
+			if (!ccu_nm_is_valid_rate(common, _n, _m))
+				continue;
+
+			tmp_rate = ccu_nm_calc_rate(parent, _n, _m);
 
 			if (ccu_is_better_rate(common, rate, tmp_rate, best_rate)) {
 				best_rate = tmp_rate;
diff --git a/drivers/clk/sunxi-ng/ccu_nm.h b/drivers/clk/sunxi-ng/ccu_nm.h
index 93c11693574f..0075df6d9697 100644
--- a/drivers/clk/sunxi-ng/ccu_nm.h
+++ b/drivers/clk/sunxi-ng/ccu_nm.h
@@ -31,6 +31,8 @@ struct ccu_nm {
 	unsigned int		fixed_post_div;
 	unsigned int		min_rate;
 	unsigned int		max_rate;
+	unsigned long		min_nm_ratio; /* minimum value for m/n */
+	unsigned long		max_nm_ratio; /* maximum value for m/n */
 
 	struct ccu_common	common;
 };
@@ -108,7 +110,8 @@ struct ccu_nm {
 		},							\
 	}
 
-#define SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT(_struct, _name,	\
+#define SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT_NM_RATIO(		\
+						 _struct, _name,	\
 						 _parent, _reg,		\
 						 _min_rate, _max_rate,	\
 						 _nshift, _nwidth,	\
@@ -117,7 +120,9 @@ struct ccu_nm {
 						 _frac_rate_0,		\
 						 _frac_rate_1,		\
 						 _gate, _lock, _flags,	\
-						 _features)		\
+						 _features,		\
+						 _min_nm_ratio,		\
+						 _max_nm_ratio)		\
 	struct ccu_nm _struct = {					\
 		.enable		= _gate,				\
 		.lock		= _lock,				\
@@ -128,6 +133,8 @@ struct ccu_nm {
 						  _frac_rate_1),	\
 		.min_rate	= _min_rate,				\
 		.max_rate	= _max_rate,				\
+		.min_nm_ratio	= _min_nm_ratio,			\
+		.max_nm_ratio	= _max_nm_ratio,			\
 		.common		= {					\
 			.reg		= _reg,				\
 			.features	= _features,			\
@@ -138,6 +145,29 @@ struct ccu_nm {
 		},							\
 	}
 
+#define SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT(_struct, _name,	\
+						 _parent, _reg,		\
+						 _min_rate, _max_rate,	\
+						 _nshift, _nwidth,	\
+						 _mshift, _mwidth,	\
+						 _frac_en, _frac_sel,	\
+						 _frac_rate_0,		\
+						 _frac_rate_1,		\
+						 _gate, _lock, _flags,	\
+						 _features)		\
+	SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX_FEAT_NM_RATIO(		\
+						_struct, _name,		\
+						_parent, _reg,		\
+						_min_rate, _max_rate,	\
+						_nshift, _nwidth,	\
+						_mshift, _mwidth,	\
+						_frac_en, _frac_sel,	\
+						_frac_rate_0,		\
+						_frac_rate_1,		\
+						_gate, _lock, _flags,	\
+						_features,		\
+						0, 0)
+
 #define SUNXI_CCU_NM_WITH_FRAC_GATE_LOCK_MIN_MAX(_struct, _name,	\
 						 _parent, _reg,		\
 						 _min_rate, _max_rate,	\

-- 
2.43.0


