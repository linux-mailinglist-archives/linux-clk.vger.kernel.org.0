Return-Path: <linux-clk+bounces-8455-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CC491272B
	for <lists+linux-clk@lfdr.de>; Fri, 21 Jun 2024 16:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BB6A1F27FE2
	for <lists+linux-clk@lfdr.de>; Fri, 21 Jun 2024 14:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B06E286A6;
	Fri, 21 Jun 2024 14:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JOHyWcz2"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11D21C2D
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718978509; cv=none; b=lSrfOR3l7wkQPzVfQ++lHzYZvqNAcB6pXupYj10YksaKWjGFqr/cwgpmGndqHpAeOPyNuDHVxDbL+Itvo/i/xbfwxniBdD1xt1lwj6+aLuhkuodpOju51rwinTG1wqj6okqxuhHxnRYxZ6slAtDP0DLSo8uu3XGRnDb6gqW5FdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718978509; c=relaxed/simple;
	bh=o8Jk/KDgS55zSjUEldegAfGbkL6Ys6e48LJPFBGTp74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S2CIITAP4AaQGEVIJQfez3uqTyKBttw1Vl0+p0B14TJ7P7eLXYZnCEE6CopGyqJjgtdgMnyO22oBE4aKTEkZbHpQdVkCXYzd7QMxyj46Sf2UmyNBJYx1pmsztOWVG7ZY9f/xjVWgm4ndzbYrrOoiGgP6HRKS8mKyYK6qltB6/yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JOHyWcz2; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cd9f9505cso556636e87.0
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718978504; x=1719583304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVyK8gM5VJzx24ZCzyzdqKTryh1LaYBXMgMLguRXSY8=;
        b=JOHyWcz2q+d8RRzLnuvRvRtvMq9p4cEd9f4OeB4sGyy+ewVgUpBpBYhahbsQXb/Xxl
         +OVg+J346NSnVcDfzJhfhKUDLXNG9DSdl+y8S4cJNIArYsI4PStNcT7ZKvh1x8dFjLaM
         zSrDMj2382AJ8vJIIS5fHhbGDk9DbLV4VOlYAYfSgjHUDAIOTFOSJuRDE7t5enwYSuHj
         hMqQawQcQBT4KZT7sr35smN+4fpptxtqG18xkEFb8qaAgG6/uNnx1ZHeS08iAa9Ova3+
         icoLi2rORUktZ/jXjnCFOj/NecbiI042eKbeWIa9hcyXULx1EpBOuts2PpJ9/+AQdAIy
         tqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718978504; x=1719583304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVyK8gM5VJzx24ZCzyzdqKTryh1LaYBXMgMLguRXSY8=;
        b=k9jdFKhLAOYm/tvySLRwgjTynRXDkn5kpUpuXjk7MXr6kOU+JYTVEpXmjzk8M/hldN
         j4Tkw7nWPkfBbjlx3wWSjdHSq7q7cVSiEiZApuuc7AEh9GnSJV3U6LM+HHPsUGK9eV0s
         zNxUsC+hHNI2iazN0dobs/Jwdse9Ux7EHjkDylHfw8QJenK0rLqUM6j77aYPHqWxN0wz
         G3GYNiAIeB3/iJF6xwQqEPLX+FKyIxTeiy5gYQQvytnirPAHfH6cPRRQXJyWAY9xf1pu
         wf7o2ibeu4L+bE4/lI/F4LrOechImiNmFbasdmH2QfYgxwSMOjybluJgZ3wzIhLHbgwi
         lR5g==
X-Forwarded-Encrypted: i=1; AJvYcCUCPrV3PXXWT0zwndhAM3Q3h44nRlKILTA6CiK5sKs3Z0kYuHzqGhiPTxP+fjQEsVin/l8omaZnP9ux/9QVcxdiYjaz3IcLu+SL
X-Gm-Message-State: AOJu0YxFUx0UC17/IgpqJdfW3D3pruKxHCJOQD1ixynaFP/t/CuLhvS6
	iBa4CmEkpN8AJpIsSr5rkcm+z4k16iuNjsOMG4rr1gZKwC+ZrFR1zJo7EwzHCv4=
X-Google-Smtp-Source: AGHT+IGn90Vc/K7XSYxwzxsNwSduYALlV+IHzILL024upvXUNpV36AAp+B2C+5pdwrjg6G3MFeWPWg==
X-Received: by 2002:ac2:4317:0:b0:52c:8944:2427 with SMTP id 2adb3069b0e04-52ccaa61fc5mr5134234e87.31.1718978503388;
        Fri, 21 Jun 2024 07:01:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f6722sm1847342f8f.24.2024.06.21.07.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:01:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 21 Jun 2024 16:01:14 +0200
Subject: [PATCH 1/5] clk: qcom: dispcc-sm8650: Park RCG's clk source at XO
 during disable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-topic-sm8650-upstream-fix-dispcc-v1-1-7b297dd9fcc1@linaro.org>
References: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
In-Reply-To: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2843;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=o8Jk/KDgS55zSjUEldegAfGbkL6Ys6e48LJPFBGTp74=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmdYfDnD+UDG34Hq8SxNde8xLsCxAmu9Zzo8CqFw2x
 vfwtYZyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnWHwwAKCRB33NvayMhJ0a+pD/
 9Pj5oFBpclrEjkPLmY5u7a/C8FuDKtb2YBM+SrWBilpqGoUo0F7A6U3iuqvpvA/6GPGRHwZMKnC29X
 8W4OWwUwIiJnc6a1N/3J7eZC4OFE0HwiWxiF8dVPKj2BPNeTFVungpupJ11ODK9ZzzgpOAqNZYxyXV
 YDTvyJCvFsgMmL18Es62eiNbTPkMnvayk0DJz+LYkDIXNrFmHaiedzT8yZM9yF2ONkfXCJfzeGAQ8q
 cHW2OkAgRWDu++oL8SpOrjFCLRVZcziUXvVgEfbNUe3Pns64y2x4meC2s6bEksj/xjm3j9ErxzUU7u
 T/0ffojPHMAm0SV2uFDOKAyKE/2lyz5IX5APxaup+sHUvTBNs9+AssqWTzYWcpHOd4sR32iNL6Xiut
 GslGCicZPdBgBMneR2p2n9HYLHPbyQakx7d6hf6r9l+C0oXrVLMv7EagnLsKwPMT6Wz6DmxhxS+CWi
 sf+vnBr9jxhSV049aCdjNWAFf3sgI4YUBNH2NxwjjjaE0hh0SNPLVKCry7MGDRch5lacgjX+3HOaAm
 pdSxpk8nfzFL5KiCZgLSGmoUVGQz2p2UEnlaJNmm44d+K67vFfLDUdD+ACJGxvkN+AZPKFGhKEIz1h
 A3UFwwqKlZ8stW01HdW1tTBMhIE90liIIBRv2wA2JLshPH/wQTGpUAo3f8cA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The RCG's clk src has to be parked at XO while disabling as per the
HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8650.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index c9d2751f5cb8..31c82f791b44 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -339,7 +339,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -457,7 +457,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -516,7 +516,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx3_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -560,7 +560,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -575,7 +575,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -647,7 +647,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -667,7 +667,7 @@ static struct clk_rcg2 disp_cc_sleep_clk_src = {
 		.parent_data = disp_cc_parent_data_9,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -682,7 +682,7 @@ static struct clk_rcg2 disp_cc_xo_clk_src = {
 		.parent_data = disp_cc_parent_data_0_ao,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0_ao),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1


