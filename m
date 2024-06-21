Return-Path: <linux-clk+bounces-8456-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2C391272C
	for <lists+linux-clk@lfdr.de>; Fri, 21 Jun 2024 16:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E98991F280D6
	for <lists+linux-clk@lfdr.de>; Fri, 21 Jun 2024 14:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA87E2BD05;
	Fri, 21 Jun 2024 14:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EC5yeuEE"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D6011CA0
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 14:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718978509; cv=none; b=doMm343bLD/Mo/qAONusT+CVRM/dvjRGn2SH6zaCIFHW8u/hT68WRchnjOYE3j49e9jdbnv52ha66z3Ex6GQaQquSI5qlml3ATZPyWCb0kS1sw6LN2OZhyJGTDygltpd9ctQxbhd18cZM8HOJJP2oGnCHI4R3go2wW3zrgLtKPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718978509; c=relaxed/simple;
	bh=s29/37KKHt3PZEwZnsIXFrVPh+olGHQ9l5FpzQHfmHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OdwHeBAWqcsRQ4F0aPm3/WruUtmNvU9zo3kCVqVchiASYm4v99DZjXD2gqcC6Gwkaf2MVKoqTRZ5NeLWLuq+kn72v6pKNs9N35LruLPQtn4kdcd+BSxI024vz5YiGSnL4IlV3muP50iXieqAjPIlHyc3CH/nIkQSeP858+sWU4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EC5yeuEE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-356c4e926a3so1970945f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 07:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718978505; x=1719583305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VTmCmBVw5TK18hnTViwPxa5USZ4/k7Zp22q2p7WUivg=;
        b=EC5yeuEED0zCLAT0OiirYaGoGFhJEws9ShPOkQsKgObdNmUb4ZHtHGStzETBrN0OzM
         MdI91x5ktx0JOEP+Ud0fxQ3eZ9gyolx3jkaLID0dH+tyLSNDghSRd8i/cQG8ZL7JZ3Xp
         nrjVAgcASZJEX/Lvd/iPgN0Tmb2jxjnBvmzYCXS9ovetMt0C5+576wyBSZiRVAgwhfGF
         xLyBPfCxtgay0qbEuc8FRq1kPqVx3Wv58WNo3LhVh0keyepwUpLTnhS7q5PF3lV/6415
         6aEWOLqGorDPSwcoL5BaREKwq1al5PQGw+hZu8Ms/kvMVhTNcxpdh9nwo0I6eizG3366
         EPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718978505; x=1719583305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTmCmBVw5TK18hnTViwPxa5USZ4/k7Zp22q2p7WUivg=;
        b=bhrjv27Ua5rmz0Sl7J0HzyQxPFzhJfgPSZSMuV8ffzYpvVxqZba5vhQZFe98NBxSvN
         UyQ6SBcdkNBX8DR0Pm+aHkT7bpPhONqOb6sInyScwbvC8PSOrsKGkQ4yUcSLSFcoG1Qq
         ApcUaMYP0hDVOU6AdMAIDGyYkatq5rkUgQKOMFlo3UPe/8Xir1sZnW6H4R86Ig9/f99Z
         QGfq0QOalBOKLyOyf5NTqagR5BaERtSipscQ/mletn+ke8/pJ1L0ixXkzEWFnv2NW3mp
         TH3R0CTq2GVZDXla785uuMvzt+hSf0FtwqeMfqRBAb2P0yBWE+huKE76Wddmj5JcmP2n
         5GgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmeYDdQuGF6uoSkOG1CVefbe/g4nMBgqtfH9rUMND9PFF2uUPGBPdUZGzpfDvALkSg1SF4VWiZBgYeTA4PobthCC6WLnDTtdVd
X-Gm-Message-State: AOJu0YxyVFyEQe5pUZ8OelfO7b96fging7Y9y5FlVulpyTRjniGua3zT
	4IlNx79+hLe8eronAhG2+ubVuW2yHVFZynHSl2vzy6gNop/oYgiFtILuANwyw1c=
X-Google-Smtp-Source: AGHT+IFxktwNEdIxzRgRaxMr7311ZbKCUGBy3Qbuf1UdLbqLslUUN9msZmInAMl92TDdPTiCwLSvqw==
X-Received: by 2002:a5d:55c6:0:b0:35f:3166:8d6 with SMTP id ffacd0b85a97d-363192d0074mr6882584f8f.52.1718978504494;
        Fri, 21 Jun 2024 07:01:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f6722sm1847342f8f.24.2024.06.21.07.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:01:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 21 Jun 2024 16:01:15 +0200
Subject: [PATCH 2/5] clk: qcom: dispcc-sm8650: use correct clk ops for
 dptx1_aux_clk_src
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-topic-sm8650-upstream-fix-dispcc-v1-2-7b297dd9fcc1@linaro.org>
References: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
In-Reply-To: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=836;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=s29/37KKHt3PZEwZnsIXFrVPh+olGHQ9l5FpzQHfmHw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmdYfDx4ESgTofISPDhVJkMyU4w7Sks9rcsq7u4Z1A
 BEpXkI6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnWHwwAKCRB33NvayMhJ0bMvD/
 4pwokQdsAV24Bn3hk2mghSfM8Rr5qBzdvPGNZBEUtbmyxB89MReRbLkuAm6A3Ay5jLptC/+cfd4XEp
 5UrdXpIeHb77rKXamOW6SLw3/Ek0dE8gTiU51SICLBYXB+0wXKdmfQMYWNvyg3jN0qtsDXoRDrXdi5
 PjgP36Gck8YK0YTCYWIAxvQ6CVqZz8O7RM8bMCuPhSBPQD9Zttd98OjRUL5SzZ70TPqTLNkxcGygkL
 jkEwZWOIc40CZPJGwfZVWAYl1gicfgkfTyvfDHujClDRc1/aIv3Lo28ugLRfh28jgYQH1LmRbIqskD
 ICkOQncVdQvr7ZyOlWkJ2Bcd8llUM25us+39G3TilMtH43bIlYcxWrtwzD56k9QvBQmU3BC3knG/Ec
 5M92rY2Ly1P8EWolMyZRJzsMHKzwalf3Rd7ldCn/ZZqumjIVlHoZGBWZB0apk/u5++vrLFhIo1J0W+
 fbkvPOXM3stI9EULzwihoplgFQVQnB0UVPM7aUmnHVp5IhsBYl/nGxvlj+o2yow1Nhbym0w4vCb2Ev
 iOYZRj/XXJOO/RGCA9iXFyoWJ8cTmIaRr1jqMoTX0pZp1T4AIDhpE34ou4esRgZozC11sko7wiGIZz
 TO583s770P5wlEgG7lRF4fB3c+lKbRzalUA8384W1Q/dC1mCDEZqnzpm/Sbg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Use the same clk clocks ops as the dptx0_aux_clk_src, dptx2_aux_clk_src
and dptx3_aux_clk_src.

Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8650.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index 31c82f791b44..70944b7128e2 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -398,7 +398,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_dp_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1


