Return-Path: <linux-clk+bounces-1618-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4612816D6B
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 13:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1741B1C23881
	for <lists+linux-clk@lfdr.de>; Mon, 18 Dec 2023 12:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAAFF4BAB0;
	Mon, 18 Dec 2023 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xXAzGQ5E"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D414B5CD
	for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 12:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d3b8184a84so2488525ad.1
        for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 04:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702901263; x=1703506063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lYTGtSYRVAJ3w0j3YsinoBhP2NVVpIT5xX2iQPFdpw=;
        b=xXAzGQ5EbKNX/Dy3L2mw797oLF8fBLW2fzRsHPP+qd/K8tdTvi3D+QnCFuo7BkTlTN
         JLNdi/9mtIMDll76NRk1tgnsNSLX/Kaboe49Ialaav0lpPG8xzLWngSQ0KKxTuziLVlC
         UkcwHxtKwucRYAUBtipfsRM5PpuoP/5Gik8K3c5p19atSF7ScE/lQp8qLu6nw4zf6X8V
         uykFqnSpyOFk4QvaUpfC1rsPEMx2Mr52Yb2ACFAd9JF8qJzR8ReqquM4RIS5cHQkVE6g
         PB6V23hGMvjsuuid9I0Kp5vjoNvTVXCA7YUfRwd2jFBDGqU1CZ5HLnQd+0vWrJhA7hdz
         FlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901263; x=1703506063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lYTGtSYRVAJ3w0j3YsinoBhP2NVVpIT5xX2iQPFdpw=;
        b=iDHK455/WqjYM4/vfTmINtQ6kZRAp0KDx1h6ZyK5VS73mruIaO3+lgGNHBCwXl+bGO
         MPFYhKa332FAZwzABXkdR5XIeud9O9xC26nFpM0vZpi6EShbZx97B8lOFikbv6l2EVMZ
         hJiheMmzDErpRFoullR3zmnUrPA3Jbk7j4mYhimcok8FzVzO7Ltx2J7/1buCkm7/chku
         j96hVUHFmVLqPw8ZDtdLvu84yPRZNnBD099gwJBT5ZLswnCP0E7DEJe4AoFn4RI5Mw4X
         R+XN1NI89ThBjtMS/T7SFv1+Ip8m6Im1hjoiFf+6g6W3xBYfWfE33vs/wLTgN3W8YsSy
         N0fg==
X-Gm-Message-State: AOJu0YyE7OvbJnSqvbxSs0cTdSb+xtmrHgCHmpAXdB2yIEeDN5ooa4aU
	mOWUFbvlI1hb+qGo8t9Yw1XQ
X-Google-Smtp-Source: AGHT+IFchFcItXdYBMDjNrlYDL5eL8NpYrejRm/1PBJqhUeZQOSSH05NdaFx3MvPVMg5AHAMkiQ1PQ==
X-Received: by 2002:a17:903:32c7:b0:1d3:6110:32fd with SMTP id i7-20020a17090332c700b001d3611032fdmr4820556plr.110.1702901263463;
        Mon, 18 Dec 2023 04:07:43 -0800 (PST)
Received: from localhost.localdomain ([117.207.27.21])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902c3d200b001d368c778dasm1285709plj.235.2023.12.18.04.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 04:07:43 -0800 (PST)
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
	quic_cang@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 03/16] dt-bindings: clock: qcom: Add missing UFS QREF clocks
Date: Mon, 18 Dec 2023 17:36:59 +0530
Message-Id: <20231218120712.16438-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
References: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing QREF clocks for UFS MEM and UFS CARD controllers.

Fixes: 0fadcdfdcf57 ("dt-bindings: clock: Add SC8180x GCC binding")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-sc8180x.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc8180x.h b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
index e893415ae13d..90c6e021a035 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8180x.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
@@ -246,6 +246,8 @@
 #define GCC_PCIE_3_CLKREF_CLK					236
 #define GCC_USB3_PRIM_CLKREF_CLK				237
 #define GCC_USB3_SEC_CLKREF_CLK					238
+#define GCC_UFS_MEM_CLKREF_EN					239
+#define GCC_UFS_CARD_CLKREF_EN					240
 
 #define GCC_EMAC_BCR						0
 #define GCC_GPU_BCR						1
-- 
2.25.1


