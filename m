Return-Path: <linux-clk+bounces-9841-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8429378A7
	for <lists+linux-clk@lfdr.de>; Fri, 19 Jul 2024 15:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2317282943
	for <lists+linux-clk@lfdr.de>; Fri, 19 Jul 2024 13:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AF914389B;
	Fri, 19 Jul 2024 13:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="katqSECl"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F8C1422CA
	for <linux-clk@vger.kernel.org>; Fri, 19 Jul 2024 13:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721396577; cv=none; b=MPFsFdmh7A3kCGCiQjWwPFHSVSctB+XTnAh4TJPEGNNSbyEqjqu2uzGiYsS/A8tQpuvCEWqa3mhmUe8YTSeNe7HX2upOn/ulY5HLc8A9klKATbZmqHfhypoJPRZDlcktkQfkGMEsAU010YcA3hCB1H/d2Izg2uTREcv8S6DrVZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721396577; c=relaxed/simple;
	bh=OObjBT5+tmi8SJwD/vGEg0LnoSk/hpHy9nJZqdaQsvM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pVAda1j8muWvuuBBjcd/CFOjGlMkB5lMU+j+WSjKA0L8Et6+/ZO0gELMbaoThDo+bfFSwawwxUIexqKPhBftp2pF4icwgnCigFTWoD1DCeNejnUw1oO254FfPR3uiJdq6YYEZ6m3fc11EESN8b94vtg1wYzFjB/PN4IVT7MhBqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=katqSECl; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-260e208e126so1014713fac.0
        for <linux-clk@vger.kernel.org>; Fri, 19 Jul 2024 06:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721396574; x=1722001374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6zxRHXX1Q8OwMxEpYD1fuoDQoSBRUnmedwW5/qepIyg=;
        b=katqSEClNIYlnTIRHm7sdp859uGyzunL0Xk06UYblNyzq40EnSXhFkK2BQtziulcFQ
         GnksgOQZ1hzDEF5lSKdSe2Jm9WgyMNQKbk8+HwbLK9yIKUqdKytgHSbYFHQwX/JraxZJ
         1dOWE/HQrGdlNjqa/z+aQAR11RA7ym4zMGgVBmVinbnb+ZtSZaoaZf1uin8XgpoAgjTu
         johMrUWct23ZKd67sYqdX5ssZTX5FSiZLNU2E56yamIzbeXS+/YL8mgholDLWt2DelGl
         Dc7RA0d73rSod873Lvtiorti+JuRkP+wroT6am0oow8jXa/sdSaRkF5Q1pdpMrZVsu1J
         9CFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721396574; x=1722001374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6zxRHXX1Q8OwMxEpYD1fuoDQoSBRUnmedwW5/qepIyg=;
        b=LpASFSRbMz1hS/5QtxhzJfYQdMWLtoHTbMgdVbszjFbpgIdbuX/9FFHy6tA77XD2Tg
         GLlm4NDt06oMickSUNM+3JIxRkUJgeVOpfi+3wHqH8pUng/sUJHnlmCOW8Ch8ETiPVJy
         1pOL0tjxbMQBkcfZq0P21pXxjc5s3ab5SJyoSfFf3up0N3qsbVTQ0nRCLb/kFcH5lH41
         4bQuM1GeuFWaqoR1W7tia8UhyQz+tKhNYVXFTArwJTkVQSqslgtB+QY+oawqWRurYDlR
         1958cZfe0PMAK7GSnTcFB6YRem6Smolr+ggsQnY5yw6CMmNdW3fzC/MsaNV3yafefoU9
         cIIw==
X-Forwarded-Encrypted: i=1; AJvYcCVSMK6v5skHtClGnUcSdN3M1jqxftjdZ9+SdrGNWZ0u88KbKaP4RNmsakUjxDn8vnvvMBGUjLFSyXq6rRF5xLv6SUZ/aiX9rJ3j
X-Gm-Message-State: AOJu0Yz0Gpre2t0N0CUHmmk0QcP/Z9NcNrj5fYILRe8RMm7PmAYIPoON
	hKROkTAVZYo3mkPlaCY6GZ/X0NiOmjWIY4yQWL1cRJhENCK6iJVelky6WM2PHEGArteB75ZCvKE
	=
X-Google-Smtp-Source: AGHT+IF797ziqOa4665rJuAHn4nLvwBl+NHT4V9kt7EP7l5a0fsyXgWUeyDot8Xa9UiXgvgE7Xem3w==
X-Received: by 2002:a05:6870:8998:b0:261:164d:6854 with SMTP id 586e51a60fabf-261164dbbe6mr817994fac.54.1721396573901;
        Fri, 19 Jul 2024 06:42:53 -0700 (PDT)
Received: from localhost.localdomain ([120.60.142.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff491088sm1190212b3a.41.2024.07.19.06.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 06:42:53 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-sm8250: Do not turn off PCIe GDSCs during gdsc_disable()
Date: Fri, 19 Jul 2024 19:12:38 +0530
Message-Id: <20240719134238.312191-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
can happen during scenarios such as system suspend and breaks the resume
of PCIe controllers from suspend.

So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
during gdsc_disable() and allow the hardware to transition the GDSCs to
retention when the parent domain enters low power state during system
suspend.

Cc: stable@vger.kernel.org # 5.7
Fixes: 3e5770921a88 ("clk: qcom: gcc: Add global clock controller driver for SM8250")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/gcc-sm8250.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 991cd8b8d597..1c59d70e0f96 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3226,7 +3226,7 @@ static struct gdsc pcie_0_gdsc = {
 	.pd = {
 		.name = "pcie_0_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct gdsc pcie_1_gdsc = {
@@ -3234,7 +3234,7 @@ static struct gdsc pcie_1_gdsc = {
 	.pd = {
 		.name = "pcie_1_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct gdsc pcie_2_gdsc = {
@@ -3242,7 +3242,7 @@ static struct gdsc pcie_2_gdsc = {
 	.pd = {
 		.name = "pcie_2_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct gdsc ufs_card_gdsc = {
-- 
2.25.1


