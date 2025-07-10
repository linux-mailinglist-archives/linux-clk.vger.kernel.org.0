Return-Path: <linux-clk+bounces-24544-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06978B00A45
	for <lists+linux-clk@lfdr.de>; Thu, 10 Jul 2025 19:44:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D8F317F5EE
	for <lists+linux-clk@lfdr.de>; Thu, 10 Jul 2025 17:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989032F2C59;
	Thu, 10 Jul 2025 17:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KrbD/Gu2"
X-Original-To: linux-clk@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAAB2F2719
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 17:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169423; cv=none; b=qrS5f+7sCq2zTz5sTd6sekw9dQqjQSG1MyciZcl1ZXCsH0UkoLjCz30Ju0NSI0o4CE218BDUkTwvd4a5+Mif40YKdBQ25XuTK5LWNszabC7zdEuaTyw0Xi8BkEm/Zh6A4JVVxm/UG4oxEdng0AH54j+Y6cABWURuek//FFTM46I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169423; c=relaxed/simple;
	bh=QsQxnV5P1fb5ziwiaykq6XlQnnjBowQ0Qm5g74Jm8ZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5ePg5r1Sj8v8rA3ZAeiGv7f+mmoewyI2zdczLt8heDL8wfvl5/r+96TcFAuyQV0SUXd/sqpvceUuPpVKksDHHxs7ch1zkCbBQBGI6O1yxPT1xxZ90Bg3YMGO/I91PW2gemW6pu5/f/1T3yKO8yr+bF51/xPSdaVVxaW2lLOzLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KrbD/Gu2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YCUkHqw4OIJFHYNlmvSZg7Gb7N9mp6WEkDCfyaw9PXU=;
	b=KrbD/Gu2fvGtJgy2zR1l438LVyMU4wyCcF6aL7v3Np7P2LaWs1vVicnNvnJ5TfWS0punHj
	GT2pQ7poa1WZVXCL6aR9pK2zaLO6SPCo3fzk5uyitlTZQ+1pGJWl9FnyxNTWCLJvIdfMSr
	f8yW8SswwyqdIxmrM0tyw1VezZVUIwg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-igV0LNAjO52zeVAX7q79JQ-1; Thu, 10 Jul 2025 13:43:39 -0400
X-MC-Unique: igV0LNAjO52zeVAX7q79JQ-1
X-Mimecast-MFC-AGG-ID: igV0LNAjO52zeVAX7q79JQ_1752169419
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb3bb94b5cso19707546d6.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 10:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169419; x=1752774219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCUkHqw4OIJFHYNlmvSZg7Gb7N9mp6WEkDCfyaw9PXU=;
        b=H2sa5DoADVRm5ud3v10SCakiDhMDxe/+RmDAVbFediEB2hI1BBPbw+jJijkz+Ye8Rp
         dMT/1nwpuscXm1DP7/Kyh2HjKGPN29EC77thGrMPhlvw+qvdKWf1Zy3EZ4RSpGp5rT6I
         qzljY5pG2JEjdkydazi2NQfMSgY5QAMun+/yJbWDYIIb5DU6VT7Pd1/gZhEZqp5FUK9M
         hb2JzZgJFcV3dvVyLBm1b0Vw8uNAwTDAG4g4W4rdRZ+yzXh89pz48nE79NhsMkU7h8dC
         oaPZAaq7p0q4S1LO++tQgyyXcB0EAL+rShY9P9lBY0MlnB5eeXc+Ytnw4DC0PzSCL2X7
         wc6g==
X-Forwarded-Encrypted: i=1; AJvYcCUEmvd/E7ifnsIZhq1JUIF3jZvVm+Rg+uIDUfQoIbx6PVtk73eForJpCH0Kg8+NgAdWVxNBY7jXYgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSCBFF0iGedj6he4FxskBEsPrdatbsI1BwT4mO2pCCLnbv1qQP
	dgIXYa0zoY+Y8ONS1QNhW/NnUYC07Eie7GBRjQFUqHGEdyAACti8phQcCkMvKyPoaHWeMy3PHKN
	ZEacp70IqsfMZ2x9G/qP4K5PgxWrMRV7C9wEtZhxx1mihvUvlDgUf++MzxIUP5g==
X-Gm-Gg: ASbGncuNt7WqM1V3nd/A+1NqkoiAdmY11TRHksLtzgDTjcQj+Jw0m9L7jj4QU6YJJnP
	m+kdajbwXpra+oIwSp9rmkg5cWfbIxDWqQXuMHXpe7QPo+J8SZ/4Iyx2VpbWLeW6D+0nPy7Ao8S
	RKVu0Q91lCGDv69498UfDcDmMRmnLrlSLQFsnm0tupA8/tDMefYmfBGcXWdVe9LAHRC+a+qrvMy
	tALu7eSbj0P2V+xeuV+B80KGfoG4ngE7Z+2irf1JEuk2oYROcLeo/R+D43CyfdrOQF46tMKHt+d
	CJ079YnKKEIqSdCEqiGOKXgpaLedGoG6CVMZHLaMp8TJQvU2FE3kqBxjNLO8
X-Received: by 2002:a05:6214:5883:b0:6f2:c88a:50b2 with SMTP id 6a1803df08f44-704a354cf6bmr4069886d6.3.1752169419273;
        Thu, 10 Jul 2025 10:43:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHT9fVCmhXOEcnhqu3VFHhqJP8lRdJ7DzuHPSbjh7k32ODCAsPCUcL2Z7QyeRoPgckrF6a+A==
X-Received: by 2002:a05:6214:5883:b0:6f2:c88a:50b2 with SMTP id 6a1803df08f44-704a354cf6bmr4069566d6.3.1752169418934;
        Thu, 10 Jul 2025 10:43:38 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:38 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:08 -0400
Subject: [PATCH 7/9] drm/stm/lvds: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-clk-round-rate-v1-7-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=2097;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=QsQxnV5P1fb5ziwiaykq6XlQnnjBowQ0Qm5g74Jm8ZQ=;
 b=Ksw8mIL+2RRN/KI5dE4mx3sGUsPAEzJtg6FBiWBslMJaF5i+drzv8/2cRkcR9a0IBfQcYS2SG
 tVJ/WPvWyYACv81xH4ZsEZ5zwtnc4MB29saRvfEdAfzM+LmC3xps5M8
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/stm/lvds.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 07788e8d3d8302a3951e97d64736b721033998d3..fe38c0984b2b552e1ccaef4d1e589b9d86a40ee3 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -682,8 +682,8 @@ static unsigned long lvds_pixel_clk_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)lvds->pixel_clock_rate;
 }
 
-static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int lvds_pixel_clk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct stm_lvds *lvds = container_of(hw, struct stm_lvds, lvds_ck_px);
 	unsigned int pll_in_khz, bdiv = 0, mdiv = 0, ndiv = 0;
@@ -703,7 +703,7 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	mode = list_first_entry(&connector->modes,
 				struct drm_display_mode, head);
 
-	pll_in_khz = (unsigned int)(*parent_rate / 1000);
+	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
 
 	if (lvds_is_dual_link(lvds->link_type))
 		multiplier = 2;
@@ -719,14 +719,16 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	lvds->pixel_clock_rate = (unsigned long)pll_get_clkout_khz(pll_in_khz, bdiv, mdiv, ndiv)
 					 * 1000 * multiplier / 7;
 
-	return lvds->pixel_clock_rate;
+	req->rate = lvds->pixel_clock_rate;
+
+	return 0;
 }
 
 static const struct clk_ops lvds_pixel_clk_ops = {
 	.enable = lvds_pixel_clk_enable,
 	.disable = lvds_pixel_clk_disable,
 	.recalc_rate = lvds_pixel_clk_recalc_rate,
-	.round_rate = lvds_pixel_clk_round_rate,
+	.determine_rate = lvds_pixel_clk_determine_rate,
 };
 
 static const struct clk_init_data clk_data = {

-- 
2.50.0


