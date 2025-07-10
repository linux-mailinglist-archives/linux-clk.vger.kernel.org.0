Return-Path: <linux-clk+bounces-24526-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74204B008AE
	for <lists+linux-clk@lfdr.de>; Thu, 10 Jul 2025 18:30:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47063189ED0B
	for <lists+linux-clk@lfdr.de>; Thu, 10 Jul 2025 16:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4B62F198C;
	Thu, 10 Jul 2025 16:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HB2poYSO"
X-Original-To: linux-clk@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5312F2F0E4D
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164879; cv=none; b=o3bCbj09eiBJ9bPeR16M+1+7cCWYVCkWlKAFEJKjFinq+Xt0U07ily03qr0UnQlZiYudfoB17dQ/GHo4yDPYqnSgU5YvXL64yVQaHHd4rZ6Ca0AAa2FwHwtLMxlAKQ/xMgrUBKQ7mIA0dNBcwwlxZuUMni9O0bE0PJ755gcn+l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164879; c=relaxed/simple;
	bh=LuIdTqZOB0IRg3CTS/bE+68lhiU63BV6cIYBbNqOn1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mub7r19Z3Wz5L0ZTw+zspMCcayXelAcGyjkTcyB9GxU6SS5BwYq1Lkvst4YcU1Ylyt8eZuuUk245WA3QsS4wxoNl9HBGjE/pMQ6XCAdJcyOc8VoE8WJP83ziWGkTBnVg+M3luW1fS6oM4zG0odI/0ExsqbuDyqEWG+Jar718U6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HB2poYSO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752164876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m2sjN1873L1CKcSDssD7CQWNs9idoOcGFXZl6j2Le2Q=;
	b=HB2poYSO96xC0Jt+FfNhuQl/gFV6qK7oTv0NUgdocv7D+HJacJYKDEfbctTYzzRgSXWsYh
	Mc5FmVeAnyGrnF9m8vM3iFN3rVspcl8vJYaBQgueNo6lIxcWgEIoAuMtN7tUVYiRhds4vw
	DjY+aKb0IHdOXbbNrvlbfGU1dEhngp8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-p4J-q7hTNsSmOtlNe2enBg-1; Thu, 10 Jul 2025 12:27:55 -0400
X-MC-Unique: p4J-q7hTNsSmOtlNe2enBg-1
X-Mimecast-MFC-AGG-ID: p4J-q7hTNsSmOtlNe2enBg_1752164875
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fe182a48acso43436006d6.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164875; x=1752769675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2sjN1873L1CKcSDssD7CQWNs9idoOcGFXZl6j2Le2Q=;
        b=Sp0KHbD7n5EawGotQOViZYgOv2U2kxXEL4eRxpFSuKZ/S3CKFwDrYUHH7F+aK0ZLWF
         7SfQCt3JOaGlDLcKibZ3g62kZsYYEcWngRBZwWyeqo7rWNc2w6020qqdMeGSCROlwvXC
         oCDcJIPRJ160EXgfejBNNlvBexD9gN/czchlXFLq46Kctmb91vlgDr9sINVpWTDenFqW
         lXDRr7pHGN3B7fS+qFBq61ZIbmPBlKIOk6RD5JU37L63sIt8toy9YZkwmR7lnK2OtYwH
         PR7z7t49Xixh8Q91/2LRlrGUXSm08rTZ/MKBTeICD3WM+MAv7DvnvZjIs//Rwa/9c56a
         uufQ==
X-Gm-Message-State: AOJu0YyfY+m9MacLJViguECcJVfEOaAOH8XijicKNLKz+zbo4Gm9lAzm
	Ws4O1yIdymHbPoKhZlUOy5jEbtfwPZtMRWgLSNSoIMxT/jaKEdi8wDrVjrku4TyggsqCftjqhTX
	Pb7s3QNQW9Q+r7v154YpTRnYiXEodn0XsLcJ8A+5V2eTKd4irHQZgJ+sti1fBKg==
X-Gm-Gg: ASbGncsIc8CrYOmYv3UmISnMWyS0cZbBw4hjzDNpcqS2yowib43ZIZFWIIG4a5Yc+DQ
	thbLd1wiVdxJN1PbBQHE0+T6QiZ6qpKJE/bQUrUEtiDrWOfMN7gxLlW879LZZffKe0YabF7JRRg
	WVFt4S1GNNln9WVsc1kl3+B0QaAK5SGG/5qIW6Sk+YOcnqUdt73PcF2v/rXGaX3dtU0mhOPlV4X
	M5DZ/LAEbpUp1rFNHvELcCK6pNWkwt/63pMqTwu19ZiKlYy05EnR0iAYngtuWLW6jzxcTgTM4UP
	4HXzsChc4NYcWROlbe90k50o2BFylQAVAHACluswoyrwrRFV96Olsotaundc
X-Received: by 2002:a05:620a:6182:b0:7d5:db8a:22ea with SMTP id af79cd13be357-7dc99c97b06mr637917985a.13.1752164874727;
        Thu, 10 Jul 2025 09:27:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0LILioTmsFFFim3P7vjwaGEN2yDghNBYxo2rYKbBHf33eWtihemHAGlXYjN5wVdu8ijbLNA==
X-Received: by 2002:a05:620a:6182:b0:7d5:db8a:22ea with SMTP id af79cd13be357-7dc99c97b06mr637913285a.13.1752164874254;
        Thu, 10 Jul 2025 09:27:54 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:27:52 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:29 -0400
Subject: [PATCH 3/7] drm/msm/dsi_phy_28nm_8960: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-3-364b1d9ee3f8@redhat.com>
References: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
In-Reply-To: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=3065;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=LuIdTqZOB0IRg3CTS/bE+68lhiU63BV6cIYBbNqOn1E=;
 b=f34Vu5Am3Epc8RhAvgL3lZpMgFt7lkFGSFFJPkt5Aq5xZNEfkcTpI3h6rM13pyuzPIwSSvM1F
 NgAw7WN4IMXByyDaw/F9whWSiB6hkeMO9L2CsMqwBUVASiJ/wkk3IUg
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 34 +++++++++++++------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index f3643320ff2f2bae5301bb94f1fe19fa03db584c..8d234685c1aa3d4579e3dc766c000de1909f87f6 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -231,21 +231,21 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 	pll_28nm->phy->pll_on = false;
 }
 
-static long dsi_pll_28nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_28nm_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
 
-	if      (rate < pll_28nm->phy->cfg->min_pll_rate)
-		return  pll_28nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_28nm->phy->cfg->max_pll_rate)
-		return  pll_28nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	if (req->rate < pll_28nm->phy->cfg->min_pll_rate)
+		req->rate = pll_28nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_28nm->phy->cfg->max_pll_rate)
+		req->rate = pll_28nm->phy->cfg->max_pll_rate;
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare,
@@ -296,18 +296,20 @@ static unsigned int get_vco_mul_factor(unsigned long byte_clk_rate)
 		return 8;
 }
 
-static long clk_bytediv_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int clk_bytediv_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	unsigned long best_parent;
 	unsigned int factor;
 
-	factor = get_vco_mul_factor(rate);
+	factor = get_vco_mul_factor(req->rate);
+
+	best_parent = req->rate * factor;
+	req->best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
 
-	best_parent = rate * factor;
-	*prate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+	req->rate = req->best_parent_rate / factor;
 
-	return *prate / factor;
+	return 0;
 }
 
 static int clk_bytediv_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -328,7 +330,7 @@ static int clk_bytediv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 /* Our special byte clock divider ops */
 static const struct clk_ops clk_bytediv_ops = {
-	.round_rate = clk_bytediv_round_rate,
+	.determine_rate = clk_bytediv_determine_rate,
 	.set_rate = clk_bytediv_set_rate,
 	.recalc_rate = clk_bytediv_recalc_rate,
 };

-- 
2.50.0


