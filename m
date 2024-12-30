Return-Path: <linux-clk+bounces-16472-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1CB9FE745
	for <lists+linux-clk@lfdr.de>; Mon, 30 Dec 2024 15:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87AAE3A225A
	for <lists+linux-clk@lfdr.de>; Mon, 30 Dec 2024 14:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1F91A83FD;
	Mon, 30 Dec 2024 14:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgtr6WdO"
X-Original-To: linux-clk@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4848F13CA99
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735570135; cv=none; b=pMC3W0LixbViDyn3FTXQz3J9sxg/o1rUuoDv1N/7WTTgLX2AKX3+WjI1JKkCWyYy843wzUDBs3IPJzb/YVx2L+RrAUGlWWswC4Nw8ilIzObh/jeeCEMq0lXgD2Fk5/5bIacwqPg6eowwYXpuWBdA58eVXQzlrjdaRG+ccFxZ40E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735570135; c=relaxed/simple;
	bh=59a2dZJMjmjt/NytiCFCEYeCUsm/hHLSksCdv2r40eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IGoibtwMObFXGK3eFpbWpuT7q0B6C1BziKE/nwIGNvPXJYQ54CT5RluEiakUGh3TMknKAl58PF7ZQVJ20V2GfJK4N7khZEs69OufOoRMqW2CbqaD+4uJgbSiwZ0bsHBrfCkv8WmXXiDmQvFmq8iz8DkAh4YmY6wAJFKgUV1cqkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgtr6WdO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUBxtCa024440
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 14:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6lQo1xlx+vLS9+8GPG23HG4garAcRuStXizh5mIHCwU=; b=cgtr6WdOOIhPTr0e
	VLzA/VpqE34dhcvdslyCz/+RzQwjYmy/uq98cl+3RBrsJgb/M3McwzamXiQlJqln
	m+jf9x/fV7MU+N43c5R+boHaClrVBy6AKCMMv7Srl4/L5eB+Cig/jtLhZeu8nW5C
	RpcHKwmkxDdTNqpZX2tSw7zeSTbQKGfrp1Y9rl8xv1am1GgjaxtDdxIq+mCCY8+M
	P7C+zKzE4/rRbJHmfsGbyIJEpxJ7jKBcBY67cvQMRzEakQw6LMF31vVcJTgjpzX5
	wEaYZImKbT/RpxrswpkwiNkoMuivYBNl1uUgvgmiW6+L2sMU6LiBY/p/wRRWgmQQ
	HsohGQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43uu4srb9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 14:48:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8f77bf546so28842206d6.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Dec 2024 06:48:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735570131; x=1736174931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6lQo1xlx+vLS9+8GPG23HG4garAcRuStXizh5mIHCwU=;
        b=oAPsuQMlQgoTH5oUXewRQ+K7l4e4AxdhKJ8Mo8xdxxAqTmDxs0Kf7i058Aj9NAxEaK
         XJ5YWgur10OJljpp6FGYybdaRnMKpPmCO66kCzAZCGCY2IAuD13PiB/5INYDyWp0+ZB6
         8raxC5uKgYnUB3berV/waJvkV4eLkYh8rPiUCSSNUDq5vO+XEFNelSsC2iTSBvDJSA0B
         9ja3JLhw6Ybuz44/KDTqcuxJ+lq8xiweGCB6USou5p6wxQMMJ5+me9sHsWt6Sj9690L9
         2yrolfuJz/1J6DL7AIeo35YNrmpS72ng5jHhqIH93GWujQphs28GEnoUI4pFj8lVYRJv
         N6hg==
X-Forwarded-Encrypted: i=1; AJvYcCX+JB+6Li+9Bf2K9kZ4D3NfEQ+Jotxr9XNkuGyd8vEZYFZtA5vTx7GZtpYkb741aOJYi89e8Wr5oRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMfYrE+cQzBCZ/Jn7yVcNyV01lSWPa2hyiZmPyg/AfLo43j7SW
	B+qmT/v6z5Dw7oj503qIhb2Dx3RHQ4r1cc3/zDKFExhKAsN+/UxAfsKmEATeVFHozyvQ/XPBkcD
	C5N9bP39EytXXcaRMloT2yhcz72/ekCXiKzlZBJrnB0plstCHL0LwKrgacZU=
X-Gm-Gg: ASbGncs1NiPCuPGJMJhz/P5RkOFPSOtdqSG8bSwhIYZuXr8Ul83A6ehWKFgNFhmQ3wg
	0V5sFUUeOMaeLcE/kDnSr57mutpLyPsCSF7+JKc+Wh4BSXfw3gpjBiO+bo7/wznm09lOGcvu/yM
	vu7DSfv7PPKOx1CSDAo08lokdaZX7WZRlRY3HoOd7Bv3celJkEg7kgLb28pA3CKNldi+tA4vUHn
	GgjrHWqz/XSY3W1X6qUp6LSb6oJimE9aXzG7oplOq2Gmk6no7YNFWyim5d1sj8TCbot3LbMKwiF
	Pk2s6IOHkW27TjW1p/79CTFWKrvMJot2sn4=
X-Received: by 2002:a05:6214:4113:b0:6d4:216a:2768 with SMTP id 6a1803df08f44-6dd233b0bb8mr230801826d6.12.1735570131283;
        Mon, 30 Dec 2024 06:48:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkzFSsRN5um9eUj3rNbYTIHXKG6grUSJsO4t9eufpIQQjVKlFGOMHCEgKi1n9+N8wVNY72qw==
X-Received: by 2002:a05:6214:4113:b0:6d4:216a:2768 with SMTP id 6a1803df08f44-6dd233b0bb8mr230801616d6.12.1735570130962;
        Mon, 30 Dec 2024 06:48:50 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d848b5c19dsm12067896a12.11.2024.12.30.06.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 06:48:49 -0800 (PST)
Message-ID: <f72ccb48-a70d-4fea-9cae-e7825538bdb4@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 15:48:48 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] arm64: dts: qcom: add Linksys EA9350 V3
To: Karl Chan <exxxxkc@getgoogleoff.me>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
 <20241002232804.3867-3-exxxxkc@getgoogleoff.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241002232804.3867-3-exxxxkc@getgoogleoff.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aCFuWbwQjUk5swgsQwp4ZAOtHMjVRt4n
X-Proofpoint-GUID: aCFuWbwQjUk5swgsQwp4ZAOtHMjVRt4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=858 impostorscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412300127

On 3.10.2024 1:28 AM, Karl Chan wrote:
> Add device tree source for Linksys EA9350 V3 which is a WiFi router based on the IPQ5018 SoC.
> 
> As of now , only the UART,USB,USB LED,buttons is working.The front PWM LED require the IPQ PWM driver.Therefore the PWM LED isn't configed in the tree.
> 
> Also The original firmware from Linksys can only boot ARM32 kernels.
> 
> As of now There seems to be no way to boot ARM64 kernels on those device.
> 
> However, it is possible to use this device tree by compiling an ARM32 kernel instead.
> 
> Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
> ---

Karl, have you had any luck trying out the 64bit u-boot referenced in
other messages in this thread?

Konrad

