Return-Path: <linux-clk+bounces-8562-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B051991485A
	for <lists+linux-clk@lfdr.de>; Mon, 24 Jun 2024 13:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B79CF1C21E66
	for <lists+linux-clk@lfdr.de>; Mon, 24 Jun 2024 11:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A388A139587;
	Mon, 24 Jun 2024 11:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Foc7599K"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27731386B3
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 11:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719227958; cv=none; b=oKjOvL1ikChSZyohQ6X0j6lMzVC754v160oDMsseFs1/iLP2TxeeQjLgbH9xCarXEb12yoL8SnjPBS4Qu9pWSMdSn3NZd6UyHeu5hUYHMG9zl521MyigFR23v8PM+/UTxQ9brx2EVEfW6V4+ZsDSTvEjPTaeGcmNIKQ6sht6Xo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719227958; c=relaxed/simple;
	bh=SNjmBO0D7BMbAU+av75Fa70a2EPNGWDJQGrk+rencIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBO6y4dxb/3Tx4RM6RpR8yVHnst7MLAs+MFICeymRNy7Axl1DJ3Vivb6h1sHVWD9hHlIeL5MeV1CMBxEmbQbJOVTlrh7xl6+KqIzgWkYD1IBjJY3FfJPztYlPoUpi0TMtBonvhFVYfedstctvhIJdoGb67T9pL9Wj9l4xKxoQl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Foc7599K; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e72224c395so45551431fa.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 04:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719227955; x=1719832755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=juf+woKCXf5btp37iLECpNl6oxMZVdudz2S5zzDkQL4=;
        b=Foc7599KDVlD65XqH4VHZtrcAa1i8g2FBFiT5tdVTRMSe8JBrhos02/2EBzXIwjJk3
         +xin/Lgmnzd/S6ZvG3iSrDTf1Jm1WQ5SoLUcc6DRha+A9ie8tj8gjjYhscS6z/FynLAC
         uD8Ev0xc3TWPV7Qxg0uN6GXKeAwTfO88IzrQbZUvsxlveAg2Fmseh8QtE32cHEDFAYv6
         Y7Cumx19tj8C4SXJnjVroseB51d3QIPF9B0xIahiK/6GFbhPGFUHiZEtaLZBP9TMyQtT
         pR9d6WNm3DaQgumDeBBypNQzaes62C+JHFKencwjXf3aL/TmCwmQBrmzuNnqeyvviug6
         +JYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719227955; x=1719832755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=juf+woKCXf5btp37iLECpNl6oxMZVdudz2S5zzDkQL4=;
        b=XnvqIH8IspVpS0GNAGpvl8eRzj25RVNZJ+nxFZAT1ViwKwOmOibybWuq+tX/XPuTAz
         rE8kP0DtwRv+i5d8gKKX/Ok5oGEPRZGF4BP27Jp6VQXxKCnEIpUylP/8tCfKFzy+ykLJ
         OeMHQJhBlrDbzx4viDRSJMvpOF+OQxe+42AANmhUUU1ftdPWRi+tWsmWTrZyGsoX9Xi9
         pvJXDHBBkwAe2CGCq0nN1iBB/UscX448BZUCk7hd4xA3ZjnMKoycDClrxTR3Qph2nHhU
         rySMu00h7t84KPC5P6CBjWJb10eB42EZaej7VfAnOoyTva73k6ICbo5kPz2CSh+5dGoM
         BVuA==
X-Forwarded-Encrypted: i=1; AJvYcCUrEegeW6401tSUwgPueZtouBa+vkHeHVSR/IJlGeTdgcePb6mgvgsooClWNDJ6Gp6f+TkUHSA9t+wsuR2U8Sks1evZmtaGwVK0
X-Gm-Message-State: AOJu0YxnlM+nlUMT9VAt7CfLwUTNyIgzGYbFuGlwrfINjfWdQkNz5CQ5
	Glmr3WXLxh/bGEWyBmI1zBt2NVCI0PiVMHtxe1HcO4uAxl9UADlq42ubab1hdE4=
X-Google-Smtp-Source: AGHT+IF2wreRxpMJJ/CsmZvrlVj+4xFYA1Wd/Ll3+2/tSINfml+I3xsXOm7U4JJn9hK5sN51EvHXFg==
X-Received: by 2002:a2e:97d1:0:b0:2ec:5488:ccaf with SMTP id 38308e7fff4ca-2ec5b2dd95dmr23710241fa.35.1719227955085;
        Mon, 24 Jun 2024 04:19:15 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4247d0c5492sm172102245e9.24.2024.06.24.04.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 04:19:14 -0700 (PDT)
Message-ID: <f45742f1-8bc5-4516-84b0-391352c4bd6d@linaro.org>
Date: Mon, 24 Jun 2024 12:19:13 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100: add soundwire controller
 resets
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240624-x1e-swr-reset-v1-0-da326d0733d4@linaro.org>
 <20240624-x1e-swr-reset-v1-3-da326d0733d4@linaro.org>
 <pb25qgv6c2fb4vjby7yiqyorzqft7oyuucotw5267bshgvw3rg@4wry5qxoubhy>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <pb25qgv6c2fb4vjby7yiqyorzqft7oyuucotw5267bshgvw3rg@4wry5qxoubhy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/06/2024 12:09, Dmitry Baryshkov wrote:
> On Mon, Jun 24, 2024 at 11:55:32AM GMT, Srinivas Kandagatla wrote:
>> Soundwire controllers (WSA, WSA2, RX, TX) require reset lines to enable
>> switching clock control from hardware to software.
>>
>> Add them along with the reset control providers.
>>
>> Without this reset we might hit fifo under/over run when we try to write to
>> soundwire device registers.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
> 
> I doesn't look like this was tested against the bindings.
True, let me do that and send a new version.

--srini
> 

