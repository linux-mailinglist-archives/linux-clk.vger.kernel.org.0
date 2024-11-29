Return-Path: <linux-clk+bounces-15132-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A89889DBB54
	for <lists+linux-clk@lfdr.de>; Thu, 28 Nov 2024 17:38:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 231AEB2224B
	for <lists+linux-clk@lfdr.de>; Thu, 28 Nov 2024 16:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1590C1C07EA;
	Thu, 28 Nov 2024 16:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QuXXPswY"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE7C1C07CB
	for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 16:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732811890; cv=none; b=UWA5FImxyIxBjp59xlycKohSxgiEMb/xO3Qi1EeVtGhd6NO2ZRTXXS7feZwh4qfkoKaMcuRNVU4ahBQpnNq7SHrXGR5sfbuJTb2lWU6eUhO8JbGihDN81nbj8TZSjYVejFOWunybzm6rQu+sL4G6tKCez4pyt/1Ov7C9v4g73w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732811890; c=relaxed/simple;
	bh=F6kS6huYzh41NUrek9OF4eqHKfMRC4xW0zjdNZqsagU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBdnlbD/jiTBzl8o8QBWCWgkAkyai274Bn7GFhb9CTHmL2tqxj1NmMXeVB3IrZ1qTZkHc7zj2SuSAJnTpVD5WCTfdbotPAnwz+DHrM1rB76v/tfI3ByXGNbabHF3tg+a4aNJ5QKzYgcqlOLUqReHFVFJFO2Kr57El2ofGccMR0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QuXXPswY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a2f3bae4so9437245e9.3
        for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 08:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732811887; x=1733416687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKEN920OmL7UDlbRsVIO5F66NiW9DJp7kX5jgbOKmaU=;
        b=QuXXPswYhGjgpvPkcFlc9lYeRtvz448fBbn2EzkTv9/qrJkegbr6kQOdYf5GxaYoN7
         aONacCqccMr1x4LAkE+zypxEInTUusRMnou8AQ5xnoTNBkkVqM2SgUq7LadV36jBpS7H
         BbmfwResywCng0tjEutscOgQxVTWdvrqOOImMGMxwG2vgkHLKVaCIy6okis/5E0ub8rS
         NLOLhgkP4slJ0tDxpB+wYK46nCRiR+nAfvytLyLdWNKpLc+e/2xgJV6mwgPIGecwoqqX
         hMBmydmYJXu4Mw63OhOyPjWkBs3hBbxkZWWFtsNaSvtv1UB1bqaFbp6AnTcqN6vQnISO
         GLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732811887; x=1733416687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKEN920OmL7UDlbRsVIO5F66NiW9DJp7kX5jgbOKmaU=;
        b=wxEPIExL2ypqSW0Eqps7DehUkLP+z1toVjZM4Rs8kb2SL1uWgWdexhTkPaup6GW7TS
         4hIrnhY1lecjq8wrq4GV3Gjn1eptrXKL1KQZdEwqsHuxOhzstJyb1LKTnplG7+PYaZQ8
         /10j8vHlmlOw8vyFJ9gPzXd4zUK2Q+eQW4GTrxvbITx0/uOTHHkVScxkuc194olaAphf
         QTG+5HlOJ5hWmqNUZwTXbjpYv29LSgtvwXim2b46E0h/iGCW5V+QH5bcuxiek93bBXeW
         OaBVbRZyMMXQB6V4o0ZBZnHzuQaN3C1H01oVR/gVIzriTvy+aWBYW8uZ5MGDCfBDdaF9
         l/eA==
X-Forwarded-Encrypted: i=1; AJvYcCXGDwoi3mCJpMly4gDNo51dB+JeI0M+zjDvHJhRV90TkCqe6idaQ86knevmrlTGj4UfdmNif0Xp13Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8kO/1i1MuECk99MfDW0p3edWEc89YXPOKWEVFHQVJrrcgF5Xp
	QbWwKdnF4laRqHknVBGNYQg/vMgmiRzJ3uQoFWCigx8V17XX+tbsJ1y5i1nmF2U=
X-Gm-Gg: ASbGncuPqmv69WB8Pk3kwA5YwV9zRw1fCyuO2GUV1BbCb3EzeUhjRvd4DDSCMFp7EwQ
	uLiT4utzwxivPulxgDBiCyiQHealQbwUI1WCu2VLOCXLlCZ7xoKfzGurnSEBtEeORub1S0+5SXC
	k2iJ1vVpTxe+fa50G2QDppDuzvsE28Xr0L02d7qjRJFWHKFULK/Us+gpQ9I8EJPIA9SCzHIU05V
	Miz3YfGxAZ0JRnCCNyxX8cu3H0PnoGXFBNX8sJN6g0/kjr6hgBLvOal8Nc=
X-Google-Smtp-Source: AGHT+IGYGOnHp31GxTsnkxHzdJCiiotGVBTL3h8xfacleLdMq1sO1fa8QiUoPmAfnOlVz2MQ4CqEMg==
X-Received: by 2002:a05:600c:5490:b0:434:a815:2b5d with SMTP id 5b1f17b1804b1-434a9de43cfmr67266455e9.24.1732811886618;
        Thu, 28 Nov 2024 08:38:06 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa78c202sm57990155e9.26.2024.11.28.08.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 08:38:06 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 28 Nov 2024 16:38:02 +0000
Subject: [PATCH v5 3/3] clk: qcom: Support attaching GDSCs to multiple
 parents
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-3-ca2826c46814@linaro.org>
References: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-0-ca2826c46814@linaro.org>
In-Reply-To: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-0-ca2826c46814@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

When a clock-controller has multiple power-domains we need to attach
parent GDSCs in that clock-controller as subdomains of each of the
power-domains.

Testing on the x1e80100 reference shows that both power-domains need to be
switched on for the GDSCs in the clock-controller to work. Some open
questions remain.

1. Should there be a hirearchy of power-domains in the clock-controller.
2. If there should be no hirearchy should the parent GDSC inside the
   clock-controller attach to each power-domain in the clock-controller.
3. If there are multiple parent GDSCs in a clock-controller do we attach
   those top-level GDSCs to each controller power-domain.
4. Finally should performance-states be applied equally across those
   power-domains.

It may be if we see more clock-controllers with multiple power-domains that
some mixture of these questions will need to be implemented for specific
hardware. Right now the approach taken here is to attach the
clock-controller GDSC parent to each clock-controller power-domain.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/common.c |  1 +
 drivers/clk/qcom/gdsc.c   | 35 +++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/gdsc.h   |  1 +
 3 files changed, 37 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index e6a024e95ab5f4b0776ffc6c7b3bebfbebb007fd..2976e360ed383f148995efcebbf73e2ebc917c83 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -327,6 +327,7 @@ int qcom_cc_really_probe(struct device *dev,
 		scd->dev = dev;
 		scd->scs = desc->gdscs;
 		scd->num = desc->num_gdscs;
+		scd->pd_list = cc->pd_list;
 		ret = gdsc_register(scd, &reset->rcdev, regmap);
 		if (ret)
 			return ret;
diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 4fc6f957d0b846cc90e50ef243f23a7a27e66899..cb4afa6d584899f3dafa380d5e01be6de9711737 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -506,6 +506,36 @@ static int gdsc_init(struct gdsc *sc)
 	return ret;
 }
 
+static int gdsc_add_subdomain_list(struct dev_pm_domain_list *pd_list,
+				   struct generic_pm_domain *subdomain)
+{
+	int i, ret;
+
+	for (i = 0; i < pd_list->num_pds; i++) {
+		struct device *dev = pd_list->pd_devs[i];
+		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+
+		ret = pm_genpd_add_subdomain(genpd, subdomain);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void gdsc_remove_subdomain_list(struct dev_pm_domain_list *pd_list,
+				       struct generic_pm_domain *subdomain)
+{
+	int i;
+
+	for (i = 0; i < pd_list->num_pds; i++) {
+		struct device *dev = pd_list->pd_devs[i];
+		struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
+
+		pm_genpd_remove_subdomain(genpd, subdomain);
+	}
+}
+
 int gdsc_register(struct gdsc_desc *desc,
 		  struct reset_controller_dev *rcdev, struct regmap *regmap)
 {
@@ -558,6 +588,9 @@ int gdsc_register(struct gdsc_desc *desc,
 			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
 			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		else if (desc->pd_list)
+			ret = gdsc_add_subdomain_list(desc->pd_list, &scs[i]->pd);
+
 		if (ret)
 			return ret;
 	}
@@ -580,6 +613,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
 			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
 		else if (!IS_ERR_OR_NULL(dev->pm_domain))
 			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
+		else if (desc->pd_list)
+			gdsc_remove_subdomain_list(desc->pd_list, &scs[i]->pd);
 	}
 	of_genpd_del_provider(dev->of_node);
 }
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 1e2779b823d1c8ca077c9b4cd0a0dbdf5f9457ef..dd843e86c05b2f30e6d9e978681580016333839d 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -80,6 +80,7 @@ struct gdsc_desc {
 	struct device *dev;
 	struct gdsc **scs;
 	size_t num;
+	struct dev_pm_domain_list *pd_list;
 };
 
 #ifdef CONFIG_QCOM_GDSC

-- 
2.45.2


