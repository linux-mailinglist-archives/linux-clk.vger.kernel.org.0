Return-Path: <linux-clk+bounces-1392-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF08812B42
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 10:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64A381F21750
	for <lists+linux-clk@lfdr.de>; Thu, 14 Dec 2023 09:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBD228DD1;
	Thu, 14 Dec 2023 09:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YtIzLFp3"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79DF10A
	for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 01:12:05 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5d7a47d06eeso78811157b3.1
        for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 01:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702545125; x=1703149925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9loaHfrne3H3i5jJvNSoB5V0DmyPKqbag1DqqG2m2L0=;
        b=YtIzLFp3ka6zvX5MZ7z4FKYBimoBFHmxXZy3pOlX+O1POaXCRmbbEULAlqRb7nbBaj
         Lg/hPPbQ6jIhVSX73KZ3vcVGdh+8X8iPi7OZB8yHj4WBpbaPnRcxZSUXybzeIqeHLwhX
         eYlrZ1TTw4l/7qqIHSLaZe35om4skdg3lDKt3pJ5IIO0eSZtzaIWZBg05TdGZywqyv9R
         lQwWupBAOrMWfASmtF2HOqyRi4lzdVDAvc1oRZgzwafWS5je8+scRjG9vOydvCIhMkKc
         CO3Jg1+8C4VLL/Wu3+U/ckYevW/D4ttLG++Qy6lzmNuvHe7wqWBaYqVwcNmmt9OA33Ld
         /iQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702545125; x=1703149925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9loaHfrne3H3i5jJvNSoB5V0DmyPKqbag1DqqG2m2L0=;
        b=pFDaEnIojrOsWZrWneHHoS/N0LT+IY6A1TOLLnwS/sYJKnaS4+Xz4pPg4W3DvqbHtu
         xQihYqAQpnJLAZjB9xnU0Qxlx0O7XT5vNai6ErFFShweVOtkKGQ6qigxUq2tKmbvwTJc
         gaX6TtWlu7LsMzLrYSFpncJhL/Tfg+yFgt5Wjy7jtsYQAkMnOrwx03GpXDpk+9QkD4nV
         D8sXk8WGeE1u/vSuPCqDRkQSTQVfwNiwLwZvrCpeefviZBkX6sXjZuw+UF+5ciOYkcRf
         5orjfa96rN+dRm+hSlaw+wA1Kf6HEqIj+kpSbFuHWOwXkFw8dMd96lcsr5oQlu1XG4OA
         pKkQ==
X-Gm-Message-State: AOJu0Yw4CffxCgqwNvPhMWau+H4EfohSUzNaSTrlhRICy3Ov769Tklug
	+4Ni1SoLvB/D8EURh3cogq8p
X-Google-Smtp-Source: AGHT+IGFrvj76C9g7DF6q0IKJE1RWepK4pib253K6Tv9NO1veFIB+KJjqnqPmgkzLZ2ovJOm1w1gxQ==
X-Received: by 2002:a05:690c:91:b0:5df:4992:d724 with SMTP id be17-20020a05690c009100b005df4992d724mr7706528ywb.41.1702545124893;
        Thu, 14 Dec 2023 01:12:04 -0800 (PST)
Received: from localhost.localdomain ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id qt13-20020a05620a8a0d00b0077d75164ef9sm5144119qkn.124.2023.12.14.01.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:12:04 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	vkoul@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 08/16] arm64: dts: qcom: sm6115: Fix UFS PHY clocks
Date: Thu, 14 Dec 2023 14:40:53 +0530
Message-Id: <20231214091101.45713-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
References: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QMP PHY used in SM6115 requires 3 clocks:

* ref - 19.2MHz reference clock from RPM
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

Fixes: 97e563bf5ba1 ("arm64: dts: qcom: sm6115: Add basic soc dtsi")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 839c60351240..40394c412fdf 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1033,8 +1033,12 @@ ufs_mem_phy: phy@4807000 {
 			#size-cells = <2>;
 			ranges;
 
-			clocks = <&gcc GCC_UFS_CLKREF_CLK>, <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
-			clock-names = "ref", "ref_aux";
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_CLKREF_CLK>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-- 
2.25.1


