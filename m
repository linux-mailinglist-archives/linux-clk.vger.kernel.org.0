Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A52518AC62
	for <lists+linux-clk@lfdr.de>; Thu, 19 Mar 2020 06:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgCSFk4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 19 Mar 2020 01:40:56 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:40708 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbgCSFkv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Mar 2020 01:40:51 -0400
Received: by mail-pj1-f68.google.com with SMTP id bo3so504908pjb.5
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2020 22:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z/69m7Zf+ruag16yCUxMLHHMI4Yg4kUCSYDk0zKgyCg=;
        b=GNA5dhAfvYYpetATfgKyqLZz5xlqU1swtnZ8dzTWy+4qldc1xRRbyXZak0HEBTVC9d
         Jrg18WL4KAFFq2QXJ3vjKAGQceRb/D6/f4UfoBnqwJuPD6vjnWCLEAEgSod9vHxQX+ej
         BDIFlrEBBqvgkoxy7lAdszwi6BFG3XySWcWss0gnwUUd/h/Qubwa+ORCnV0/Ib6kBol+
         fT1t1to1sBkgDvDUMTaiZ6+nxhevdSVkkIy8YmE9K+gLRLnZMnWOW4g1B8kl2bfEGH7G
         m1mrtPFlotMHwVAHSswInC3EoDzYxrkyaHseIgZBkpXvDTfh5DzDlbFaQ9omhU8wXQTi
         1hag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z/69m7Zf+ruag16yCUxMLHHMI4Yg4kUCSYDk0zKgyCg=;
        b=AHZBvEJyG4oaZh7oMPVOvme0cebJcMCTfbAv+AMw3M0s2Io8mO2RDbwiJ7bwo+bgn3
         8+gU77qOi1y4lPCHEw9EvinAMj74t2oEesl9X+dHzRTVy0N6axUET9OjzCqaeTzSl7nd
         PuRYMM2IvHOZ67ovxFQKBkqBW8wOpAcu3GMTT41VWoqAL2Hkd8TYcvN8vbyhkGhu+l2t
         aQNKoLjelFuqjFPWxewuqzzJGLjq3gjwhPtBMBAyiQQLC33mC6jwz7M9X0MobPQ9Dq7l
         o8c6Iid6EzvtfDkLWnBRXaVgA3mCUWjouuA5F14qOkBqPvbWy8BC9bzw3nTidMvGARpI
         fYyg==
X-Gm-Message-State: ANhLgQ02FrDWWTj5nKJNo/WJRXkEucwCIJTQXWGMG5KK5jvrB6ZEGyCW
        i/5VWyHwGAYnCfQVCoxetDWRZg==
X-Google-Smtp-Source: ADFU+vsRf2sDvae95TJ6VcZ7xmIYGkaloU4QXsDM6UWMf7v+/ukUDbAHYC3DGNVQzt1wESDRV1ejsA==
X-Received: by 2002:a17:90a:e505:: with SMTP id t5mr1967909pjy.101.1584596448549;
        Wed, 18 Mar 2020 22:40:48 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l125sm229126pgl.57.2020.03.18.22.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 22:40:47 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>
Subject: [PATCH 4/4] arm64: dts: qcom: msm8996: Make GPU node control GPU_GX GDSC
Date:   Wed, 18 Mar 2020 22:39:02 -0700
Message-Id: <20200319053902.3415984-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200319053902.3415984-1-bjorn.andersson@linaro.org>
References: <20200319053902.3415984-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Presumably the GPU node needs to control both the GPU and GPU GX power
domains, but given that GPU GX now depends on the GPU GDSC both can
effectively be controlled by controlling GPU GX. So use this instead.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 14827adebd94..f29f45e9737b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -639,7 +639,7 @@ gpu@b00000 {
 				"mem",
 				"mem_iface";
 
-			power-domains = <&mmcc GPU_GDSC>;
+			power-domains = <&mmcc GPU_GX_GDSC>;
 			iommus = <&adreno_smmu 0>;
 
 			nvmem-cells = <&gpu_speed_bin>;
-- 
2.24.0

