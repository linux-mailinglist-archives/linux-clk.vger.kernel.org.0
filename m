Return-Path: <linux-clk+bounces-2868-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6E383BD4D
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jan 2024 10:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F8BF1C234F6
	for <lists+linux-clk@lfdr.de>; Thu, 25 Jan 2024 09:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535BE1BF3B;
	Thu, 25 Jan 2024 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="coRIzuKu"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BB51CABE
	for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 09:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706174892; cv=none; b=s8zLPlzGtobQ/5Ryweywa5IwU5tGQ87+mGftD73/bwGO1gPOd/g9k4KCbNdKRTrJQtD1Z9ncBSdkm2ir8LCwrG9GcfwYasKQkEZ1rA1jGUi6zwAA1hCJk7J3JlPkA7j7+2oPUnFwY0PRJlqAuOxuAxKLDW5jusjfHny/bK7kMoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706174892; c=relaxed/simple;
	bh=4FhzQMyuNRu9cVH4Ij85n7GCnfVD5xm77q2Ax+afBBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iYW9PosMDlRMGcr0yTPvs97L+LTE411a+5IjnaAWKdB19OE4ld+gz09zoe3i7nKP4zXajHhxs3ktJcd47MdweaoRRSpD+MR5W3pPmjczi0ajyj6rD2sU0RRKINLGKZbh+M1iLQuDui2MIJ7y/xuMf0wfxIUt0BiOlkRzGOSK9O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=coRIzuKu; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55a87dfc3b5so5615061a12.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 01:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706174889; x=1706779689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLNRnzxe4/p0rMB0AsJl/Ri8TUeEmBjJpE+eIe/tTYA=;
        b=coRIzuKuOqIEM+LyOBo1js6mdCEXlkaoOnr2ooeVDFveVHAfyHgfoMC0ltSa3bwLrN
         laA4YoDrkvJNGh+xkaGYFKdaiivNALfXPaSRmLNz4yWdIBfHYp+oEKj2fo4I/gjDDHuc
         piAgusGkJOVxEskVui+yGGxrSooR89YlNlrM1VQYgbA/hfK5+PFtvr1vKS5ZCiW14AuA
         wUJSDCXbJLtw91BRQicjQxWwp4nXakLEnLaaaM1njgl1+Im0W+VOIXmMSUlI4T0fZgOG
         xPKRAZmuUbGIQ1YQOxXy9iGm10PSasjaGkjhBgFOdl+xlBJfmgERpPb9e2xAh8bCR3gX
         5mKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706174889; x=1706779689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JLNRnzxe4/p0rMB0AsJl/Ri8TUeEmBjJpE+eIe/tTYA=;
        b=qqwponOfvKw33aK9ELPCDWkAnHa5y1HV/ToIGz4gVpKl3eJT5ETy7Y3dQ2uXVxD7wr
         X/ZQBzvMqSVssW7G36XNgRcY4eZckj1oWrlDSdmP2myWazouFH9hqKIL0xOMXyKmCSTT
         qq3Z8aeZeSLlAQmb7XEkseDvXyjdCzoJXz4OQGAMgXxTHu9j0lZmaaOULJvzKBNluTiS
         uE+DnpDv+MuMIbzFvZY++U5sVvkiTndDavTOu4eIE3vfPwxfi2BYjtNvP2TanZ1KO7lf
         VgkM0j/XieILEmFjMnioyhxvdA5tf24SHMRpNex1ZXo53AfAYnTd/j+JBleetR3MOa2A
         CDhg==
X-Gm-Message-State: AOJu0YxkTcwXLb9dAD7RL5/WJgps7H4vEsJNJPAPw++DwiXgmsoYueoa
	NW2SE1dbbjni/FGlFIAS4LpWXXXmOvvn4eFiLI4N36/TS7gtyNuMaNdVZvhKQfSS6Ay/lNOT/nA
	q
X-Google-Smtp-Source: AGHT+IGF5HE4900Esq4LG85HNYrVZua2xMqt9RXVRLh3ifbkx5FX+VjRG/Dgu3rYNjdwZlS4bfnKWQ==
X-Received: by 2002:a05:6402:714:b0:55c:8cdc:b2c6 with SMTP id w20-20020a056402071400b0055c8cdcb2c6mr381105edx.10.1706174888969;
        Thu, 25 Jan 2024 01:28:08 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id f19-20020a056402005300b00554af5ec62asm17356391edu.8.2024.01.25.01.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 01:28:08 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 25 Jan 2024 11:27:49 +0200
Subject: [PATCH 5/5] clk: qcom: dispcc-sm8650: Drop the Disp AHB DT
 provided clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240125-dispcc-sm8550-sm8650-drop-disp-ahb-clk-v1-5-0f8d96156156@linaro.org>
References: <20240125-dispcc-sm8550-sm8650-drop-disp-ahb-clk-v1-0-0f8d96156156@linaro.org>
In-Reply-To: <20240125-dispcc-sm8550-sm8650-drop-disp-ahb-clk-v1-0-0f8d96156156@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=699; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=4FhzQMyuNRu9cVH4Ij85n7GCnfVD5xm77q2Ax+afBBk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlsimf+b1kIT9CRygBqdcl6OsrWJwKtA+IS6Mus
 59bM1COowaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbIpnwAKCRAbX0TJAJUV
 VlNhD/4j69Ljrfvn/PVcSUIvyHNmnIqC/mxKxo6qN/NK0EfeFzzFY2G28aABZxuSQtAZLCxu0+B
 UV9Xb8QZ2l0Ka9aCnVP4TF+Ax1UmVfnqX5WQOWlKbqQ9eqoeqyknMjjTgNjyqsxHUZ0xdFZN+/g
 LhzweFk6FmQwvNfKusPau6VTHufo9+p9eo5q5RAt1vgs5GYLmDcdp38ecMp7eaPUcNhss+TTjeh
 Mk++gwVLfuY8cpV2R3wsLLoWjb1hyiSvkZrghWIfJYPRsUGFCAmM2CKqz9Ej9znvNhDk4+DANVt
 FtB6NXyAMkc7JVOYBzHzA/969k1biyHNdbt9Gj3mxiZZlcfylpTV5+wtUMX5pz12zMz2UchLbJY
 dDxZVqFZB5Lpptalv295B6C+eOVZ1N0a9h9HdmHRVUWgMky6iMqLKN+toGvS/rRkiSJ5Ph4HOVv
 7xWTKWGsmrmfnaj2we4MakE5Z7RBX/t2eroX5EqdChrob8YjXFSAtK6RAGyoF7ZmrC0efqFbQjV
 8zctck7/adbJY5iaGtMeXvBVoJBrIysiV4mOoYRCH13Sl3lhEyebf8ZniBJ6n6s65EUnJbuYcEk
 gEnDmU2gOgyRAkC9W5QibH6CVlw9giEVR+lnNFO1S+t2SFwogomzfN5utkvGqUFFUXExwaWMUdu
 /ppzcrqQc93R5Yw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The GCC doesn't even register the Disp AHB clock. It enables it
on probe though. So drop it from the list of DT provided clocks as well.

Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8650.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index f3b1d9d16bae..382ebc1866b9 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -29,7 +29,6 @@
 enum {
 	DT_BI_TCXO,
 	DT_BI_TCXO_AO,
-	DT_AHB_CLK,
 	DT_SLEEP_CLK,
 
 	DT_DSI0_PHY_PLL_OUT_BYTECLK,

-- 
2.34.1


