Return-Path: <linux-clk+bounces-14005-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFA39B6218
	for <lists+linux-clk@lfdr.de>; Wed, 30 Oct 2024 12:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EAF91F21387
	for <lists+linux-clk@lfdr.de>; Wed, 30 Oct 2024 11:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F6A1E5000;
	Wed, 30 Oct 2024 11:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmKL9W22"
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932054D8A7;
	Wed, 30 Oct 2024 11:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730288514; cv=none; b=drWSIPyDAuR7wTT5xd/lTXkMqgzQVRSvkOKowSjh4MmzpEZ9lYR/hFwSxuyga2BYi3kTbZQkiKXAArbW4Mqzg2Y0z87hkTQJ9FydHLISH10iczSM+4xbK/FYOceRvLqOkBe+AR87VBsny+8T7yp+7EYB01mL3phcNO9xQuCUKyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730288514; c=relaxed/simple;
	bh=dEngFlK9Rtyp1bAJAMWKeAPbVbBJn5c95yQLe/29+iY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MCk2jHs9+y70RGBhxEpD3PiRqIG95GobpRQU/+bsfRjvIG+RrHbHg90XIK1/Z9SaeWT2eZ0U83qfXnRMIrzCKE1bh5HpEX2+QWeRY8Ec3r5eBvf/AlBgM6huv8NH+8Vje2PUqfbSc9sffA2YcFXdHJ2esJeB1MsyL2aScy9gU7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmKL9W22; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2771EC4CEE3;
	Wed, 30 Oct 2024 11:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730288514;
	bh=dEngFlK9Rtyp1bAJAMWKeAPbVbBJn5c95yQLe/29+iY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gmKL9W22Hd85Gi8UCRCYA2LYWsUZQtaZsKbvkXIrGQsjkr8xopZPP1EI5Zylb5ouo
	 +DzXrXnVHVBmCNxo2O1FMWm1xKeIF5O3MnCiHIbKU0kRUtURKUKYGzCdzMJhdAEwXo
	 SEyL4FJzyG8ItIpVb7BARA5T7dfKSaUyOhQwh0Qy1KhAlolUXuJothM6KsgTozIn3U
	 Wh5b1DzCLLrVEhnFkqLmXkoBIifuiQ3PgqeBcQkxQtrgsp32hsDnkrqeqQPtZGzrMx
	 4/9JXnGh6CdfBvgj2iBFUKlrfD2zDDk8FGWVnqTSdPSNaDaSf7QsRHu4IE+zlFb5G/
	 qiQderCqhntcw==
Message-ID: <3b123fe4-12dd-4951-ad14-32159fd10089@kernel.org>
Date: Wed, 30 Oct 2024 12:41:45 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom: Add GPU clocks for
 QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Imran Shaik <quic_imrashai@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
 Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
 <20241024-qcs8300-mm-patches-v2-1-76c905060d0a@quicinc.com>
 <jhwf2slcwvkpxggqt42mfmnyiibhbnvwtqk3to7ueq3ppla7q7@23qrl2z56ygu>
 <0487791a-f31b-4427-b13b-b7ab6a80378b@quicinc.com>
 <ae61b485-d3af-4226-b2f8-e89ef5b4ed71@kernel.org>
 <fff416f9-4ea7-4117-87b0-986087f8e142@quicinc.com>
 <9bd4c63b-7c68-4e40-9995-9d569eed15b5@kernel.org>
 <f7551a7a-885c-4f74-8f74-10f1c0ebe6ad@quicinc.com>
 <46c19729-b31e-42e3-a6dd-6b43b27348d8@kernel.org>
 <ixnqjfb6l7cz4qp23zevtbwws72rjo25cfgvntyiauzdg2yisw@vr2t4qy4k6iq>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ixnqjfb6l7cz4qp23zevtbwws72rjo25cfgvntyiauzdg2yisw@vr2t4qy4k6iq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/10/2024 12:23, Dmitry Baryshkov wrote:
> On Wed, Oct 30, 2024 at 08:30:59AM +0100, Krzysztof Kozlowski wrote:
>> On 30/10/2024 07:59, Imran Shaik wrote:
>>>
>>>
>>> On 10/29/2024 3:06 PM, Krzysztof Kozlowski wrote:
>>>> On 29/10/2024 10:23, Imran Shaik wrote:
>>>>>
>>>>>
>>>>> On 10/28/2024 12:35 PM, Krzysztof Kozlowski wrote:
>>>>>> On 28/10/2024 06:15, Imran Shaik wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 10/26/2024 5:50 PM, Krzysztof Kozlowski wrote:
>>>>>>>> On Thu, Oct 24, 2024 at 07:01:14PM +0530, Imran Shaik wrote:
>>>>>>>>> The QCS8300 GPU clock controller is mostly identical to SA8775P, but
>>>>>>>>> QCS8300 has few additional clocks and minor differences. Hence, reuse
>>>>>>>>> SA8775P gpucc bindings and add additional clocks required for QCS8300.
>>>>>>>>
>>>>>>>> IIUC, these clocks are not valid for SA8775p. How do we deal with such
>>>>>>>> cases for other Qualcomm SoCs?
>>>>>>>>
>>>>>>>
>>>>>>> These newly added clocks are not applicable to SA8755P. In the
>>>>>>> gpucc-sa8775p driver, these clocks are marked to NULL for the SA8755P,
>>>>>>> ensuring they are not registered to the CCF.
>>>>>>
>>>>>> I meant bindings. And existing practice.
>>>>>>
>>>>>
>>>>> In the bindings, the same approach is followed in other Qualcomm SoCs as
>>>>> well, where additional clocks are added to the existing identical SoC’s
>>>>> bindings.
>>>>>
>>>>> https://lore.kernel.org/r/20240818204348.197788-2-danila@jiaxyga.com
>>>>
>>>> Exactly, defines are very different, so no, it is not the same approach.
>>>>
>>>
>>> I believe the QCS8300 approach is same as that of SM8475. In the SM8475 
>>> SoC, GPLL2 and GPLL3 are the additional clock bindings compared to the 
>>> SM8450. Similarly, in the QCS8300, the GPU_CC_*_ACCU_SHIFT_CLK clock 
>>> bindings are additional to the SA8775P.
>>>
>>> We are also following this approach across all SoCs in the downstream 
>>> msm-kernel as well.
>>>
>>> Please let me know if I am missing anything here.
>>
>> Not sure, please take the same approach as SM8475, not a different one.
> 
> Just for my understanding, are you proposing to prefix the
> platform-specific defines with platform name (like it was done for
> SM8475)?

Yes. Maybe SM8475 did something more, so let's take similar approach.

Best regards,
Krzysztof


