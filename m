Return-Path: <linux-clk+bounces-5511-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D53AB89878D
	for <lists+linux-clk@lfdr.de>; Thu,  4 Apr 2024 14:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E69BB283F6
	for <lists+linux-clk@lfdr.de>; Thu,  4 Apr 2024 12:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA1712CD9C;
	Thu,  4 Apr 2024 12:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PnIv1xFS"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCF512AAD9
	for <linux-clk@vger.kernel.org>; Thu,  4 Apr 2024 12:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233600; cv=none; b=Yy1PFrDNAH3TW5h2SdFo1udhIqBS3nxxMLpNRL9+ofhbuLEEqdnVn0ZkibWSCxNGjOTx85nnYoSOKsU+985SdJSiotf1TK6XJlNPM0TcMO8vfUpz4BRDtUX0iATI89TDpBN9VbNsA+nyxfyNMIuNeT2OtBQ9M62f38eihx1PlW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233600; c=relaxed/simple;
	bh=ZVqYn4HwzkGZ3NORH7tsH/YjN519R6At8CFrNLiJlP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vm+LDiUKuLvPCrvsjZdMVWJSh23nuudaUaoR5zeI8HXUq7x7jcU2TUR93g49H7IaRapqC1a1+eVHXEOdgPjJ996qI8Bine80dRafqpbMAP9CnNZybVnxqzO45Tz5IR1CJPnLbKsxdMDOtI7VXkL8Z09ZsUftWpb1FJfdPfIgbhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PnIv1xFS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-34005b5927eso597156f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Apr 2024 05:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233597; x=1712838397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXdNsPRMeRxKNgTMvoC/YAjHT8cRrzE1LWBWedHVt+0=;
        b=PnIv1xFSetuTntTpKBn3ADePES8dq7kv/PSI9xfp1L5cxBxSmnEevldAyagG7ANFz1
         VBlsM35fKy1q84sP+yTCZgvJEabTTeyJTX5JG19AtVQt7ZGzrrlwagNFv0PeG5TLfPco
         l7rjb4595TH4api0so9ieOw+DHTAdNU0MW3/yDbg0Is07E4V2acwmfiYJwHtMtZY4N20
         6DRo2lBVwmDo+r2ltBXuOm62WJ5c9rs/GnoUSnulTFM9179hJ/tx6RzJiMHy1Dc7LCo3
         zyqxgZlsEaVA2fxF9ERkCuliO6EElrN5C7lB0IgmRHlCOiKxRkLJ0u7cZ42iQyXpKQR9
         9mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233597; x=1712838397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nXdNsPRMeRxKNgTMvoC/YAjHT8cRrzE1LWBWedHVt+0=;
        b=u1hWcQJ96eWlDIInA9IbqlXII/mE+xd5mTV7mAflc3BIhGBEZBWjHsAUCoCdSNptyU
         r0BlYCPnccveJ+zOjuxHRTF7JBz9fOln+1RTCda1eGg60uY+HF3RsV+4tcu6A8HhpK2E
         stC7K2W2Bbow3p5W0LzSpUDW52u2q4hiI+vckbOzYdCLiF0i9kaFxMxnKjOi4mn9GkXl
         LSsDKe1ukxNl1Z2i54t9wcDJOKZQLY0FImpu885/rESwbgq1kJdMV/wlygmXokgbniMg
         BJFjmKMpvL2mSwsxYGdtJLcfZ7m1G5bNILyuOYmGQQp2MyWZSkfr7+ze2Id0ms2PXNYb
         rasA==
X-Forwarded-Encrypted: i=1; AJvYcCU3QGZeBUrFqSyyvOHq+XhdOmkohROFxYsuvbmca5/yN/9Xkp+8+V/Dm7/1k4GnX6ZoNFRKB8k+cKG4DPHrrWJAc1hcoOzHErz7
X-Gm-Message-State: AOJu0YwdlUegzqxdOLs6dXA6cxBGmREee/f9g1gQJ7LvV9FJ1aOJUSJE
	sUySfvWFjCji23Rmt7sVJXhhE5LqLhKb2safg8nIu4LHd1NHQKNX+oSknon6742tE4iq8g+R7zZ
	sb6w=
X-Google-Smtp-Source: AGHT+IG4W3L5dd8Mb63CZZWsH81KaevKLECBBmrLli4fW9RjtXnQf5HkEcp1WxySDAX4sVMmwjF8dQ==
X-Received: by 2002:adf:db46:0:b0:343:7884:fb52 with SMTP id f6-20020adfdb46000000b003437884fb52mr1946795wrj.50.1712233597343;
        Thu, 04 Apr 2024 05:26:37 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:26:36 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	chanho61.park@samsung.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 04/17] dt-bindings: phy: samsung,ufs-phy: Add dedicated gs101-ufs-phy compatible
Date: Thu,  4 Apr 2024 13:25:46 +0100
Message-ID: <20240404122559.898930-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240404122559.898930-1-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update dt schema to include the gs101 ufs phy compatible.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
index 782f975b43ae..f402e31bf58d 100644
--- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
@@ -15,6 +15,7 @@ properties:
 
   compatible:
     enum:
+      - google,gs101-ufs-phy
       - samsung,exynos7-ufs-phy
       - samsung,exynosautov9-ufs-phy
       - tesla,fsd-ufs-phy
-- 
2.44.0.478.gd926399ef9-goog


