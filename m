Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAD9C4C6B89
	for <lists+linux-clk@lfdr.de>; Mon, 28 Feb 2022 13:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbiB1MEA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 28 Feb 2022 07:04:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236134AbiB1MD6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Feb 2022 07:03:58 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7B113E98
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 04:03:13 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id j15so20902373lfe.11
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 04:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WUq6dVsYfpD4P/uZF09r4NVmA7ksvXvAvHcnEd7r77o=;
        b=pp3n0MqhEtK0qRqscGSx3OkJewglMUfRKbC26nCjhZs2NlpLhaEmr19fytcnm7B0/y
         HoF9OVB1g5ozIIjXKnOYi9j82pjWzsjHZibTsQWTAzc+4pR+JSOqOrHiiPlbSVx/t1Eo
         6K//kHKZGf0Xg8B16NYC2nDJqnSSFkfLOrr8FlRjYFxy/n4z38cnAVgDMrXuLjMxUiMJ
         hvPDvi5KdMIXDb0GPadS47Etr/SnNbRhWew7uycMXd7Ow15nNgZ7h2zNscVFILypxxia
         k8uh1GYomdfQqCPozQ7p0EX4C04sEKTFlZSG6lDNvhQcH2f6NdPUbFgW3BoyHR4n/k8D
         y/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WUq6dVsYfpD4P/uZF09r4NVmA7ksvXvAvHcnEd7r77o=;
        b=q1iqLZ+tSszsqCGy2HQWFhc5auNpuprorP7BXHf2WTcHrAI9WWH+HArtOJeDKvotON
         QvB9oeETNjA77YETIFr2QwVutZFVPcJvvCD4EKHpdnlIwllhJ17N5onKtLSc/OS0EYcr
         Mbn8vpX9ZvKwMU0LgW858dvFzKiGhLZkPrcrU9+siskqzANXpjY5J2+qm8bqGMIvBHi+
         z0WfERHRrgErH6UmzI/Oa8ZhetCkdWvxbhN4dEnBlSl6LUsAT3p/Ww1Ott7Gq1jPR7ok
         5aq+jZ/MqkVsC/1F/ZI5HwrCOzTDYId+yjHATbBv1ZfmRMVl4nSbvaGwrt4AIAt0iksA
         APLA==
X-Gm-Message-State: AOAM53232QxB1RWh0GJH5w647pAXY05O6anh5Jo2/U0eAIDQAT/WYPTO
        dQyglO3ARaXuvko60j2QZLEcgQ==
X-Google-Smtp-Source: ABdhPJw5hJJzYAk6640NWdYXTqqGsyGZiuzm7eJ1NBAamr37CWek4U3GchjV9o+mFW1uU1Sca6ih9g==
X-Received: by 2002:ac2:5bc7:0:b0:442:c31e:876a with SMTP id u7-20020ac25bc7000000b00442c31e876amr12682128lfn.382.1646049791866;
        Mon, 28 Feb 2022 04:03:11 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id j19-20020a2e6e13000000b002463d2595fbsm1284253ljc.7.2022.02.28.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:03:11 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 0/8] clk: qcom: add camera clock controller driver for SM8450 SoC
Date:   Mon, 28 Feb 2022 14:02:56 +0200
Message-Id: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The patchset adds support of a camera clock controller found on
QCOM SM8450 SoC, noticeably a camcc pll2 is a new "rivian evo"
type of pll, its generic support is added in the series.

Note that SM8450 ES variant has a slightly different configurtion,
the published version is intended to support SM8450 CS SoC.

Marijn Suijten (1):
  clk: qcom: Fix sorting of SDX_GCC_65 in Makefile and Kconfig

Vladimir Zapolskiy (7):
  dt-bindings: clock: add QCOM SM8450 camera clock bindings
  arm64: dts: qcom: sm8450: Add description of camera clock controller
  clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
  clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
  clk: qcom: clk-alpha-pll: export lucid evo PLL configuration interfaces
  clk: qcom: clk-alpha-pll: add rivian evo PLL configuration interfaces
  clk: qcom: add camera clock controller driver for SM8450 SoC

 .../bindings/clock/qcom,camcc-sm8450.yaml     |   87 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   19 +
 drivers/clk/qcom/Kconfig                      |   19 +-
 drivers/clk/qcom/Makefile                     |    3 +-
 drivers/clk/qcom/camcc-sm8450.c               | 2869 +++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c              |  145 +-
 drivers/clk/qcom/clk-alpha-pll.h              |   11 +-
 include/dt-bindings/clock/qcom,camcc-sm8450.h |  159 +
 8 files changed, 3299 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,camcc-sm8450.yaml
 create mode 100644 drivers/clk/qcom/camcc-sm8450.c
 create mode 100644 include/dt-bindings/clock/qcom,camcc-sm8450.h

-- 
2.33.0

