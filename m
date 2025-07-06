Return-Path: <linux-clk+bounces-24143-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88504AF88F5
	for <lists+linux-clk@lfdr.de>; Fri,  4 Jul 2025 09:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D78B4859D6
	for <lists+linux-clk@lfdr.de>; Fri,  4 Jul 2025 07:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B531C279DAA;
	Fri,  4 Jul 2025 07:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WEiXB9bX"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C35262FF6
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 07:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613436; cv=none; b=HduokxL+DxtwK6mNGIcvB2GmKlGfqykuSqE6PagENFLZO2RTU1+lLQRg7lzgELCBKOMjhNGD5NZoYBokEXG4UmLLVrTjkR4oSJyAiEibJ3A7s4lJ5K6Ds8nJKgTY/EkLG/wIOWO7Bher97AtNHHjiOVnUX5VhBYcykP6rMI/+D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613436; c=relaxed/simple;
	bh=WEDOiEFaIuCIuMx9QpwHtbudKxci3T1kQojeog8ab1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUwh6EaWV6HgRO4qv5phNhYCnDJweoPhXvSYP/YibeehkC7ofHpTSaCvZiICJZevBTTZE1kiO/rPiQTipZps65q8D6Ds6Z+k+zoHeLxmrv1gVS8cumcZqfQT1tj27bHsRK0GRuOlWrGJay6vTOScpWfA8VwE0Iqdk1F9fCE7Ns4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WEiXB9bX; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so985412a12.2
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 00:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751613433; x=1752218233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObV9aMDnHMMEJ0mO0zQzyaaA+ak9cS5sIBz04rXlZDY=;
        b=WEiXB9bXfteLCo3nESaJaC+B6EiFb1UtxEXGA7DC9Bmlf9Z93Yixd5EoG6nttQ5XgK
         J1bBeUN+mJVdwzpcel5TDvu327wBd9K+GOlznOPFkrc9PXPWB74hmIuHaazNtUSolmPu
         PdhErDQooyy/EjVACcocZiz1hbWhA72nZ3RXCeftf60uWC0B8KQ2if9WoHN8+S9T2XIG
         eRbtHbaF3lFAsQKgcD8qMhlmW1onwM9+6net19Pw0rS+/VIgH7wiEtQV9AfnP7cZBUjH
         1F5SOHJiWtwbL/1wHRSFAR8QhVTs8K4XtaGCUOkN1s7Aj7vit/7yIMav/iygvwuwPB6L
         dsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751613433; x=1752218233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObV9aMDnHMMEJ0mO0zQzyaaA+ak9cS5sIBz04rXlZDY=;
        b=wJUt8wZsWmCVwiqrjBEqZlpw9ISe8gJWZyexTnD/JTnEe221/YbJ1JlgMMNj0EgITg
         jyd3J2Y7FSllhhv+moJLaArB7VYo7B9ZZON36fVCY9xN+gymuh8j1GyR+4CRi2T0P3zv
         aDpVfBAaZKxhio8ctSomElhkFw2Abo6V0ZOib0T7K/T6dN2EHv4NmsLeY3BSVx4L4LcL
         WO0VCKE43OeRqk7D7c2dr+1KoPEteuMKFUMUjhGLKmDF7/5cGyiB0bptQoBZT/GGpy60
         xkNeXZYdN2UICHGBJoPxzWYFobvXw35ErliR1xqdtTvT80SKRqyXZuYbgbNk9bfbk6fC
         jDqA==
X-Forwarded-Encrypted: i=1; AJvYcCWSfU98iqHHo8HqoI5XvssS9sWXD1PuktoUM7kaOcfrUqUCFL+6RjbjZFraLgPravOB5//j0Dfqclo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy99dzXdB7cD969UYaZHg3c9TuCdA74cHmyvJBEPHvBnETnutkG
	7upFhlPlrHSC6adpNkzpto26cT3oZSdZXZruocuS0ZqrSqrydi9z0xtAoYtwi0NLPU0=
X-Gm-Gg: ASbGncv4WXP/GHF4Jq3LbX35Qinab2o6E0DPJKXAnSeIB7Se+gE64Qka8jqsPPzz7TH
	1JLZLcUtava+lr6kE4qh0e00HHsj+wRdZHEp3bBLPerfT8hiyGCMLZk2jOyITBLuNCAyP6XH2W9
	A5mvlSJwAppgfS9dV+NScafuBycm3Dgz2wHVp1GT1teQATbZcm6VjCh0W3SJlzLbSo3WOwjBZaO
	Q33PH7uMp4JubnpzBMVOxJc/L0e+NSzIUn1J/wLfUm/76++xNKX3FkjHEpLecPyc6ae05X3Nm+n
	T98gV1oiePgmG98CJ8gh9JJ1rE5eK3B8P/1VmjKlCnMMXNpobVmQ0SRM3oBey/Cuhyxd8ujhV5J
	hnpOhpA5DHBG2HKzwsuRImB+QcshdMp65jMbV7eYYPJY=
X-Google-Smtp-Source: AGHT+IEeV3Kn0cO3kR2tRlEoBkxBkhC7lFjM9MhwWz48Em0WJ4DrWIyGYbBz0+fejRI4ZiAN8fozmg==
X-Received: by 2002:a17:906:6a28:b0:ae0:7db8:4189 with SMTP id a640c23a62f3a-ae3fbc56e59mr134073166b.18.1751613433448;
        Fri, 04 Jul 2025 00:17:13 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm119401766b.7.2025.07.04.00.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:17:12 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 04 Jul 2025 09:16:53 +0200
Subject: [PATCH v2 01/11] clk: qcom: common: Add support to register rcg
 dfs in qcom_cc_really_probe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
In-Reply-To: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751613431; l=1425;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WEDOiEFaIuCIuMx9QpwHtbudKxci3T1kQojeog8ab1o=;
 b=8lgV4fcoO76mnpDOKf3MXb6JTVVbunfJKkGXJqbGA1kJqSDvkrKaCvRKkzUbioxE+iz/7wRo8
 jjECGd4oVdHDozI0ZZsy9hvNox95UzV/nqjk+mRsclTKifsh4TN2ckr
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support to register the rcg dfs in qcom_cc_really_probe(). This
allows users to move the call from the probe function to static
properties.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/common.c | 8 ++++++++
 drivers/clk/qcom/common.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index b3838d885db25f183979576e5c685c07dc6a7049..d53f290c6121f31d06cf244f72603b694966e216 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -390,6 +390,14 @@ int qcom_cc_really_probe(struct device *dev,
 			goto put_rpm;
 	}
 
+	if (desc->dfs_rcgs && desc->num_dfs_rcgs) {
+		ret = qcom_cc_register_rcg_dfs(regmap,
+					       desc->dfs_rcgs,
+					       desc->num_dfs_rcgs);
+		if (ret)
+			goto put_rpm;
+	}
+
 	cc->rclks = rclks;
 	cc->num_rclks = num_clks;
 
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 0f4b2d40c65cf94de694226f63ca30f4181d0ce5..dbe7ebe5b8710fb03c1671ac9022e608a6aad35f 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -43,6 +43,8 @@ struct qcom_cc_desc {
 	size_t num_gdscs;
 	struct clk_hw **clk_hws;
 	size_t num_clk_hws;
+	const struct clk_rcg_dfs_data *dfs_rcgs;
+	size_t num_dfs_rcgs;
 	const struct qcom_icc_hws_data *icc_hws;
 	size_t num_icc_hws;
 	unsigned int icc_first_node_id;

-- 
2.50.0


