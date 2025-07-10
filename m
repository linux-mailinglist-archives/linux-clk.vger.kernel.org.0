Return-Path: <linux-clk+bounces-24542-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EE1B00A44
	for <lists+linux-clk@lfdr.de>; Thu, 10 Jul 2025 19:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CB371C84826
	for <lists+linux-clk@lfdr.de>; Thu, 10 Jul 2025 17:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9502F234C;
	Thu, 10 Jul 2025 17:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MxdvLNWC"
X-Original-To: linux-clk@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEF72F0E36
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 17:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169416; cv=none; b=V+lMPCNIAfL4u8S2TCKDRy08H4w0Ozwf22kIOq0csuIL+KocsvCR1635PdEfBs1hynBOmVDXGK4uN53NL9e0aIxws3Tn0yAgdMHG7w29ByzFUD3XJi8JRLg5ne75gD5GncR65FTEo7CnbgZxroF2oKDgQGLEPZjzO2UG4OmW114=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169416; c=relaxed/simple;
	bh=Uzde4F/sfQBVHQNcjDIBT9HB34JjyGuqbe7jNdblqLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lew+EeYuciQsa0xtXAGCiF/dwcTeMmHXNqz6p4xeZTyptDjA6gZKtxfq5umwczYuPdOu+Kc3pYOANxYHu4xbNORCyvbef8u4RRKxk1/gHqMl5c73glNAFkzSIbRmYD1lT5O0PrFHjM7G3jp9HGegchQraXdz/tUn7kxkaEQJTuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MxdvLNWC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e37lSQKt1hx5PQsR5CacpUsq2th6rpfG9r3kIy+fF3Y=;
	b=MxdvLNWCCDxudfCHkneSAo0mkKlPVrzsXXgsZ7dc3gVJHi/N8MqzjIePA3bX1/WYpwBnUN
	OiibdNOZVJ5w5CTGEi08iRLSh6TSqhpydJSmxHQs/+0MINT0TEH5XIumSqa9EcpdPx+ADL
	1yY60XJYmskihHQYAYTM9NCZkGpBfMs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-Duu5Me4fMMiXRdzV47xK_Q-1; Thu, 10 Jul 2025 13:43:33 -0400
X-MC-Unique: Duu5Me4fMMiXRdzV47xK_Q-1
X-Mimecast-MFC-AGG-ID: Duu5Me4fMMiXRdzV47xK_Q_1752169413
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb520a74c8so22543776d6.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 10:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169413; x=1752774213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e37lSQKt1hx5PQsR5CacpUsq2th6rpfG9r3kIy+fF3Y=;
        b=mzIndA1Wsnn/2MJgx/ruOO0Wrpk2wCdf5axWq9zBfvpNgoRcD0rHBUlkvo7BtuuCdB
         m3DZcxtxU5g6wGZ+3T7kHKlbsC3upCdpfLb4XJPyASpuGQSMoRKuk4ZJF2A9yNPSpfav
         HSP/9+9Di1Xq0r1MZBI/RNCF/qBgxnYmKXFqUptXRBtsf0jppJZDVsuVfsLLZhp8GdKX
         OL34QkuuiPkGEea7asTa9rSEdkcE5+khPB8Cz3HddN/FyN3KZ58im2GO2pb/q5wRk3x1
         sKwFAe5RCc2Gq9FGiX4RieikdmCmNDaV+R92XIhcwwznpTOdN0IcXv7gv4mQiYChPYFL
         TqIg==
X-Forwarded-Encrypted: i=1; AJvYcCVWkFVAEzxcC71IkneKO6hXxgP5nAM/N9AIPDMtXjDmbPwtnKw4EEiBM4Fl723PAdYpxI+YjzYaO/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKDLzFJuE62atQ52iv4W2ZL6vIrDZ8pKfQrF7Fh2vUN+Oqdk2x
	Kwxro9daaocSRIwKDJIwQLnSaPep5N8Cz0hbMxD9T3ZBES5zfA5/ATuU9VCZSlU+o5oX4KJ6n/d
	So+7lCcgijbZQoYzp3yfdsQYZnIiSjVUYBdXdrmO+I/z5iQ0Wn2D016KAQxQ/sg==
X-Gm-Gg: ASbGncsJG+XYBS2RFlXHU/9rComdTzSDHnjQHOfXy3vYV6KSVIbLh1y6Q90HiXewLbh
	an8KjHSpOJj3++Du+4zOtxTbOCTWjF7P47k7intLATJA2YZxMOHISjBfrRLFv+9shQvYVDuGOwE
	fizE2jpFzNVYsGe+4VAEbIg5fw4HkLyyzTNKh15PobwE58qh8LyugEhLi/5yhVX4KUPeTdEavnJ
	ubNVAsWjYVNrnyJpx/A40x1cIP1FlCZNYyTHsWROPnWctwKSD4hBO7Nrp1AnubxGsvBXw39ox8a
	vSRMfnJZevGEndqGeODhe5b10oujg0rWsKsMq4pogsA4YcN7mCgwBDMkGf7n
X-Received: by 2002:a05:6214:5d89:b0:701:775:70b8 with SMTP id 6a1803df08f44-704a3a4449cmr3580746d6.38.1752169412770;
        Thu, 10 Jul 2025 10:43:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpu8L3YGRW12uiQDpOxMNgeR30Y84ZsZlrx/wXIc8LbcnhH9LwZm0nYnuoy1dfBl7P78vOQw==
X-Received: by 2002:a05:6214:5d89:b0:701:775:70b8 with SMTP id 6a1803df08f44-704a3a4449cmr3580236d6.38.1752169412340;
        Thu, 10 Jul 2025 10:43:32 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:06 -0400
Subject: [PATCH 5/9] drm/pl111: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1663;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Uzde4F/sfQBVHQNcjDIBT9HB34JjyGuqbe7jNdblqLw=;
 b=0pYUMWvjxgx4WfuoWRCVGEVL5ZYYPMN0neD5N8OcfZKIHag1vghAK3SLtnfFRHjfYafmDTVi+
 fTHFTPespiOCXPSLsOLNifbUMGk0HbP0Ww4Oh/+lSRoq6wnUOICkRwy
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/pl111/pl111_display.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index b9fe926a49e8bb42116ac382010829e333edbf8f..6d567e5c7c6fd559ba369a2761d3c402a14c6fe4 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -473,12 +473,15 @@ static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long pl111_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int pl111_clk_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	int div = pl111_clk_div_choose_div(hw, rate, prate, true);
+	int div = pl111_clk_div_choose_div(hw, req->rate,
+					   &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long pl111_clk_div_recalc_rate(struct clk_hw *hw,
@@ -528,7 +531,7 @@ static int pl111_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops pl111_clk_div_ops = {
 	.recalc_rate = pl111_clk_div_recalc_rate,
-	.round_rate = pl111_clk_div_round_rate,
+	.determine_rate = pl111_clk_div_determine_rate,
 	.set_rate = pl111_clk_div_set_rate,
 };
 

-- 
2.50.0


